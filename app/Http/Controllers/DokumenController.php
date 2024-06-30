<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dokumen;
use App\Models\Draft;
use App\Models\History;
use App\Models\KategoriDokumenController ;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class DokumenController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth'); // Memastikan pengguna harus login
    }

    public function input(Request $request)
{
    $exampleDocument = Dokumen::first();
    $inputType = $exampleDocument ? $exampleDocument->inputType : 'file';
    return view('input_dokumen', compact('inputType'));
}

    

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'judul_dokumen' => 'required|string|max:255',
            'deskripsi_dokumen' => 'required|string',
            'kategori_dokumen' => 'required|string',
            'validasi_dokumen' => 'required|string',
            'tahun_dokumen' => 'required|int',
           'inputType' => 'required|string|in:file,link',
            'dokumen_file' => $request->inputType === 'file' ? 'required|file|max:10240' : 'nullable',
            'dokumen_link' => $request->inputType === 'link' ? 'required|url' : 'nullable',
            'tags' => 'nullable|string',
            'created_by' => 'nullable|string',
            'permissions' => 'array',
        ]);

        if ($request->inputType === 'file') {
            $fileName = str_replace(' ', '_', $request->dokumen_file->getClientOriginalName());
            $path = $request->dokumen_file->storeAs('public/documents', $fileName);
            $dokumenFile = $fileName;
            $dokumenLink = null; // Pastikan link di-set menjadi null jika dokumen adalah file
        } else {
            $dokumenFile = null; // Pastikan file di-set menjadi null jika dokumen adalah link
            $dokumenLink = $validatedData['dokumen_link'];
        }
          // Mengambil dan menggabungkan permissions menjadi string yang dipisahkan oleh koma
        $permissions = implode(',', $request->input('permissions', []));

          $user = Auth::user();
          if (!$user) {
              return redirect()->route('login')->with('error', 'Silakan login terlebih dahulu.');
          }

        // Buat dokumen dengan nilai created_by yang sesuai
        $dokumen = Dokumen::create([
            'judul_dokumen' => $validatedData['judul_dokumen'],
            'deskripsi_dokumen' => $validatedData['deskripsi_dokumen'],
            'kategori_dokumen' => $validatedData['kategori_dokumen'],
            'validasi_dokumen' => $validatedData['validasi_dokumen'],
            'tahun_dokumen' => $validatedData['tahun_dokumen'],
            'dokumen_file' => $dokumenFile,
            'dokumen_link' => $dokumenLink,
            'tags' => $validatedData['tags'] ?? null,
            'view' => $permissions, // Simpan permissions di kolom view
            'status' => 'active',
            'created_by' => $validatedData['created_by'] ?? $user->name, // Menggunakan nama pengguna yang sedang login jika tidak ada created_by
        ]);

        return redirect()->route('list-dokumen')->with('success', 'Dokumen berhasil ditambahkan!');
    }
    public function getKategoriDokumen()
    {
        $kategoriDokumen = KategoriDokumen::all(); // Ambil semua data dari tabel kategori_dokumen
        return view('get-nama-dokumen', compact('KategoriDokumen')); // Kirim data ke view
    }

    public function listDokumen()
    {
        $documents = Dokumen::where('status', '!=', 'draft')->get();
        return view('list-dokumen', ['documents' => $documents]);
    }

    public function processList(Request $request)
    {
        return redirect()->route('list-dokumen')->with('success', 'Data berhasil diproses.');
    }

    public function edit($id)
    {
        $document = Dokumen::findOrFail($id);
        $exampleDocument = Dokumen::first();
        $inputType = $exampleDocument ? $exampleDocument->inputType : 'file';
        return view('edit', compact('document', 'inputType'));
    }

    public function update(Request $request, $id)
    {
        $document = Dokumen::findOrFail($id);
    
        History::create([
            'dokumen_id' => $document->id,
            'judul_dokumen' => $document->judul_dokumen,
            'deskripsi_dokumen' => $document->deskripsi_dokumen,
            'kategori_dokumen' => $document->kategori_dokumen,
            'validasi_dokumen' => $document->validasi_dokumen,
            'tahun_dokumen' => $document->tahun_dokumen,
            'dokumen_file' => $document->dokumen_file,
            'dokumen_link' => $document->dokumen_link,
            'tags' => $document->tags,
            'created_by' =>$document->created_by,
            'view' => $document->view,
        ]);
    
        $validatedData = $request->validate([
            'judul_dokumen' => 'required|string|max:255',
            'deskripsi_dokumen' => 'required|string',
            'kategori_dokumen' => 'required|string',
            'validasi_dokumen' => 'required|string',
            'tahun_dokumen' => 'required|integer',
            'tags' => 'nullable|string',
            'created_by' => 'nullable|string',
            'view' => 'array',
            'edit_dokumen_file' => $document->inputType == 'file' ? 'nullable|file|mimes:pdf,docx,jpeg,png,jpg|max:2048' : '',
            'edit_dokumen_link' => $document->inputType == 'link' ? 'nullable|url' : '',
        ]);
        // Handling inputType based input
        if ($request->inputType === 'file' && $request->hasFile('edit_dokumen_file')) {
            $fileName = str_replace(' ', '_', $request->file('edit_dokumen_file')->getClientOriginalName());
            $path = $request->file('edit_dokumen_file')->storeAs('public/documents', $fileName);

            // Save new file
            $document->dokumen_file = $fileName;
            $document->dokumen_link = null; // Ensure link is set to null if document is file

        } elseif ($request->inputType === 'link') {
            // Save new link
            $document->dokumen_link = $validatedData['edit_dokumen_link'];
            $document->dokumen_file = null; // Ensure file is set to null if document is link
        }

         // Menggabungkan nilai checkbox menjadi string terpisah koma
         $viewPermissions = implode(',', $request->permissions ?? []);
         $document->view = $viewPermissions;

        $user = Auth::user();
        if (!$user) {
            return redirect()->route('login')->with('error', 'Silakan login terlebih dahulu.');
        }
    
        $document->judul_dokumen = $validatedData['judul_dokumen'];
        $document->deskripsi_dokumen = $validatedData['deskripsi_dokumen'];
        $document->kategori_dokumen = $validatedData['kategori_dokumen'];
        $document->validasi_dokumen = $validatedData['validasi_dokumen'];
        $document->tahun_dokumen = $validatedData['tahun_dokumen'];
        $document->tags = $validatedData['tags'] ?? null;
        $document->created_by = $validatedData['created_by'] ?? $user->name;

        $document->save();
    
        Log::info('Document after update', ['document' => $document]);

        return redirect()->route('list-dokumen')->with('success', 'Details dokumen berhasil diperbarui.');
    }

    public function moveToDraft($id)
    {
        $document = Dokumen::findOrFail($id);

        Log::info('Menghapus dokumen dengan ID: ' . $id, ['document' => $document]);

        $user = Auth::user();
        Log::info('User info:', ['user' => $user]);

        if (!$user) {
            return redirect()->route('login')->with('error', 'Silakan login terlebih dahulu.');
        }

        $draft = Draft::create([
            'judul_dokumen' => $document->judul_dokumen,
            'deskripsi_dokumen' => $document->deskripsi_dokumen,
            'kategori_dokumen' => $document->kategori_dokumen,
            'validasi_dokumen' => $document->validasi_dokumen,
            'tahun_dokumen' => $document->tahun_dokumen,
            'dokumen_file' => $document->dokumen_file,
            'tags' => $document->tags,
            'status' => 'draft',
            'created_by' => $document->created_by,
        ]);

        Log::info('Dokumen dipindahkan ke draft', ['draft' => $draft]);

        $document->delete();

        Log::info('Dokumen dihapus dari tabel dokumens', ['document' => $document]);

        return redirect()->route('list-dokumen')->with('success', 'Dokumen berhasil dihapus');
    }

    public function getUserName()
    {
        $user = Auth::user();
        return response()->json(['name' => $user->name]);
    }

    public function history($id)
    {
        $dokumen = Dokumen::findOrFail($id);
        $histories = $dokumen->histories()->orderBy('created_at', 'desc')->get(['id', 'judul_dokumen', 'deskripsi_dokumen', 'kategori_dokumen', 'validasi_dokumen', 'tahun_dokumen', 'dokumen_file','dokumen_link', 'tags', 'created_by', 'created_at','view',]);

        return view('history', compact('dokumen', 'histories'));
    }

    public function index()
    {
        $user = Auth::user();
        $jabatan = $user->jabatan;

        // Dapatkan semua dokumen yang sesuai dengan jabatan user yang login
        $documents = Dokumen::where('view', 'like', "%{$jabatan}%")->get();

        return view('list-dokumen', compact('documents'));
    }
}