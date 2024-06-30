<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DokumenController;
use App\Http\Controllers\DokumenUserController;
use App\Http\Controllers\DraftDocumentController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CreateUser;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\KategoriDokumenController;
use App\Http\Controllers\JabatanController;
use App\Http\Controllers\ValidasiController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/logout', function () {
    Auth::logout();
    return redirect('/login');
})->name('logout');

Auth::routes();


Route::post('/logout', function () {
    Auth::logout();
    return redirect('/login');
})->name('logout');
// Rute untuk menghapus dokumen dari draft
Route::delete('draft-dokumen/{id}', [DraftDocumentController::class, 'delete'])->name('draft.delete');

// Rute untuk memindahkan dokumen dari draft ke list dokumen
Route::post('draft-dokumen/unarchive/{id}', [DraftDocumentController::class, 'unarchive'])->name('draft-dokumen.unarchive');

// routes/web.php
Route::get('dokumen/{id}/history', [DokumenController::class, 'history'])->name('dokumen.history');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/input-dokumen', [DokumenController::class, 'input'])->name('input-dokumen');
Route::get('/list-dokumen', [DokumenController::class, 'listDokumen'])->name('list-dokumen');
Route::get('/list-dokumen-user', [DokumenUserController::class, 'listDokumen'])->name('list-dokumen-user');
Route::post('simpan-dokumen', [DokumenController::class, 'store'])->name('simpan-dokumen');
Route::post('list-dokumen/process', [DokumenController::class, 'processList'])->name('list-dokumen.process');
Route::get('/kategori-dokumen', [DokumenController::class, 'kategori'])->name('kategori-dokumen');
Route::get('/dokumen/{id}/edit', [DokumenController::class, 'edit'])->name('dokumen.edit');
Route::put('/dokumen/{id}', [DokumenController::class, 'update'])->name('dokumen.update');
Route::get('/search-dokumen', [DokumenController::class, 'search'])->name('search-dokumen');
Route::post('/dokumen/{id}/move-to-draft', [DokumenController::class, 'moveToDraft'])->name('dokumen.moveToDraft');
Route::get('/draft', [DraftDocumentController::class, 'index'])->name('draft-dokumen');
Route::delete('/draft/{id}', [DraftDocumentController::class, 'delete'])->name('draft.delete');
Route::get('/dokumens', [DraftDocumentController::class, 'index'])->name('dokumens.index');
Route::delete('/dokumens/{id}/draft', [DraftDocumentController::class, 'moveToDraft'])->name('dokumens.moveToDraft');
Route::get('/draft-dokumen', [DraftDocumentController::class, 'index'])->name('draft-dokumen');
Route::get('/about-me', [UserController::class, 'aboutMe'])->name('about-me');
Route::get('/input-user', [CreateUser::class, 'create'])->name('input-user');
Route::post('/simpan-user', [CreateUser::class, 'store'])->name('simpan-user');
Route::get('/list-user', [CreateUser::class, 'listUser'])->name('list-user');
Route::get('/get-user-name', [DokumenController::class, 'getUserName']);
Route::get('/list-user/{id}/edit', [CreateUser::class, 'edit'])->name('edit-user');
Route::put('/list-user/{id}', [CreateUser::class, 'update'])->name('update-user');
Route::put('/list-user/{id}/approve', [CreateUser::class, 'approveUser'])->name('approve-user');
Route::get('/list-user', [CreateUser::class, 'index'])->name('list-user');
Route::get('/draft', [DraftDocumentController::class, 'index'])->name('draft-dokumen');
Route::delete('/draft/{id}', [DraftDocumentController::class, 'delete'])->name('draft.delete');
Route::get('/dokumens', [DraftDocumentController::class, 'index'])->name('dokumens.index');
Route::delete('/dokumens/{id}/draft', [DraftDocumentController::class, 'moveToDraft'])->name('dokumens.moveToDraft');
Route::get('/draft-dokumen', [DraftDocumentController::class, 'index'])->name('draft-dokumen');
Route::put('/approve-all', [CreateUser::class, 'approveAll'])->name('approve-all');
Route::put('/cancel-all', [CreateUser::class, 'cancelAll'])->name('cancel-all');
Route::get('/kategori-dokumen', [KategoriDokumenController::class, 'getKategoriDokumen'])->name('kategori-dokumen');
Route::get('/kategori-dokumen-view', [KategoriDokumenController::class, 'index'])->name('kategori-dokumen.index');
Route::post('/kategori-dokumen-view', [KategoriDokumenController::class, 'store'])->name('kategori-dokumen.store');
Route::get('/kategori-dokumen-view/{id}/edit', [KategoriDokumenController::class, 'edit'])->name('kategori-dokumen.edit');
Route::put('/kategori-dokumen-view/{id}', [KategoriDokumenController::class, 'update'])->name('kategori-dokumen.update');
Route::delete('/kategori-dokumen-view/{id}', [KategoriDokumenController::class, 'destroy'])->name('kategori-dokumen.destroy');
Route::get('/jabatan', [JabatanController::class, 'getJabatan'])->name('jabatan');
Route::get('/jabatan-view', [JabatanController::class, 'index'])->name('jabatan.index');
Route::post('/jabatan-view', [JabatanController::class, 'store'])->name('jabatan.store');
Route::get('/jabatan-view/{id}/edit', [JabatanController::class, 'edit'])->name('jabatan.edit');
Route::put('/jabatan-view/{id}', [JabatanController::class, 'update'])->name('jabatan.update');
Route::delete('/jabatan-view/{id}', [JabatanController::class, 'destroy'])->name('jabatan.destroy');
Route::get('/get-unapproved-users', [UserController::class, 'getUnapprovedUsers'])->name('get-unapproved-users');
Route::get('/input-dokumen', [JabatanController::class, 'create'])->name('input-dokumen');
Route::get('/validasi', [ValidasiController::class, 'index'])->name('validasi.index');
Route::get('/validasi/create', [ValidasiController::class, 'create'])->name('validasi.create');
Route::post('/validasi/store', [ValidasiController::class, 'store'])->name('validasi.store');
Route::get('/validasi/edit/{id}', [ValidasiController::class, 'edit'])->name('validasi.edit');
Route::post('/validasi/update/{id}', [ValidasiController::class, 'update'])->name('validasi.update');
Route::delete('/validasi/destroy/{id}', [ValidasiController::class, 'destroy'])->name('validasi.destroy');
Route::get('/get-validasi-dokumen', [ValidasiController::class, 'getValidasiDokumen'])->name('get-validasi-dokumen');
Route::get('/input-dokumen', [JabatanController::class, 'create'])->name('input-dokumen');
Route::get('/input-dokumen', [DokumenController::class, 'showForm'])->name('input-dokumen');
Route::middleware('auth')->group(function () {
    // Route untuk halaman input dokumen
    Route::get('/input-dokumen', [DokumenUserController::class, 'input'])->name('input-dokumen');
    
    // Route untuk menampilkan list dokumen user
    Route::get('/list-dokumen-user', [DokumenUserController::class, 'listDokumenUser'])->name('list-dokumen-user');
    
    // Route untuk menyimpan dokumen baru
    Route::post('/store-dokumen', [DokumenUserController::class, 'store'])->name('store-dokumen');
    
    // Route untuk menampilkan halaman edit dokumen
    Route::get('/edit-dokumen/{id}', [DokumenUserController::class, 'edit'])->name('edit-dokumen');
    
    // Route untuk memperbarui dokumen
    Route::put('/update-dokumen/{id}', [DokumenUserController::class, 'update'])->name('update-dokumen');
    
    // Route untuk memindahkan dokumen ke draft
    Route::get('/move-to-draft/{id}', [DokumenUserController::class, 'moveToDraft'])->name('move-to-draft');
    
    // Route untuk menampilkan history dokumen
    Route::get('/history-dokumen/{id}', [DokumenUserController::class, 'history'])->name('history-dokumen');
    
    // Route untuk memproses list dokumen
    Route::post('/process-list-dokumen', [DokumenUserController::class, 'processList'])->name('process-list-dokumen');
    Route::get('/validasi', [ValidasiController::class, 'index'])->name('validasi.index');
    Route::get('/validasi/create', [ValidasiController::class, 'create'])->name('validasi.create');
    Route::post('/validasi/store', [ValidasiController::class, 'store'])->name('validasi.store');
    Route::get('/validasi/edit/{id}', [ValidasiController::class, 'edit'])->name('validasi.edit');
    Route::post('/validasi/update/{id}', [ValidasiController::class, 'update'])->name('validasi.update');
    Route::delete('/validasi/destroy/{id}', [ValidasiController::class, 'destroy'])->name('validasi.destroy');
});

// Route untuk mendapatkan nama pengguna dalam format JSON
Route::get('/get-user-name', [DokumenUserController::class, 'getUserName'])->name('get-user-name');
Route::get('/get-validasi-dokumen', [ValidasiController::class, 'getValidasiDokumen'])->name('get-validasi-dokumen');





