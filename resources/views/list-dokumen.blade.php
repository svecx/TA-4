@extends('layouts.app')

@section('content')
<div class="navigasi" style="margin-top:50px">
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="position:fixed">
            <a class="nav-link" id="v-pills-home-tab" href="{{ route('home') }}" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
            <a class="nav-link" id="v-pills-profile-tab" href="{{ route('input-dokumen') }}" role="tab" aria-controls="v-pills-profile" aria-selected="false">Input Dokumen</a>
            <a class="nav-link active" id="v-pills-messages-tab" href="{{ route('list-dokumen') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Dokumen</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-dokumen-user') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">Dokumen Saya</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('draft-dokumen') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">Deleted Dokumen</a>
            @if(auth()->check() && auth()->user()->approved && (auth()->user()->jabatan === 'Admin' || auth()->user()->jabatan === 'Kaprodi'))
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('kategori-dokumen.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Kategori</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('jabatan.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Jabatan</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('validasi-dokumen.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Validasi</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-user') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List User</a>
    @endif
        </div>
        <div class="form-label" id="v-pills-tabContent" style="margin-left: 200px; width: calc(100% - 200px);">
            <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <h3 class="mt-3 mb-3">List Dokumen</h3>
            <!-- Icon search dan filter -->
            <div style=" margin-bottom: 10px; display: flex; align-items:center;">
            <div style="position: relative; width:300px">
                    <input type="text" class="form-control" placeholder="Search" id="search" style="padding-right: 30px;">
                    <span style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer;" id="searchIcon">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </span>
                </div>
                <select name="yearFilter" class="form-control" id="yearFilter" style="width:300px;">
                        <option value="all">Tahun Dokumen</option>
                        <option value="newest">Terbaru</option>
                        <option value="oldest">Terlama</option>
                </select>
                <div style="position: relative;">
                    <select name="filter" class="form-control" id="filter" style="width:230px;">
                        <option value="all">All</option>
                        <option value="Dokumen Visi Misi">Dokumen Visi Misi</option>
                        <option value="Dokumen Tujuan">Dokumen Tujuan</option>
                        <option value="Dokumen Strategi">Dokumen Strategi</option> <!-- Menambahkan opsi "Strategi" -->
                        <option value="Dokumen Tata Pamong">Dokumen Tata Pamong</option>
                        <option value="Dokumen Tata Kelola">Dokumen Tata Kelola</option>
                        <option value="Dokumen Kerjasama">Dokumen Kerjasama</option>
                        <option value="Dokumen Mahasiswa">Dokumen Mahasiswa</option>
                        <option value="Dokumen Sumber Daya Manusia">Dokumen Sumber Daya Manusia</option>
                        <option value="Dokumen Keuangan">Dokumen Keuangan</option>
                        <option value="Dokumen Sarana Prasarana">Dokumen Sarana Prasarana</option>
                        <option value="Dokumen Pendidikan">Dokumen Pendidikan</option>
                        <option value="Dokumen Penelitian">Dokumen Penelitian</option>
                        <option value="Dokumen Pengabdian Kepada Masyarakat">Dokumen Pengabdian Kepada Masyarakat</option>
                        <option value="Dokumen Iuran">Dokumen Iuran</option>
                        <option value="Dokumen Capaian Tridarma">Dokumen Capaian Tridarma</option>
                    </select>
                    <span style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px;">
                        <i class="fa fa-filter" aria-hidden="true"></i>
                    </span>
                </div>
            </div>
            <!-- Table Daftar Dokumen -->
            <table class="table table-striped table-bordered" style=" width: calc(100% - 220px);">
    <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">Judul Dokumen</th>
            <th scope="col" style="width: 8rem;">Deskripsi</th>
            <th scope="col">Kategori</th>
            <th scope="col">Pembuat</th>
            <th scope="col" style="width: 8rem;">Validasi</th>
            <th scope="col" style="width: 5rem;">Tahun</th>
            <th scope="col">File</th>
            <th scope="col">Tags</th>
            <th scope="col" style="width: 5rem;">Aksi</th>
            <th scope="col" style="width: 7.5rem;">View</th>
        </tr>
    </thead>
    <tbody id="documentTableBody">
    @php $no = 1; @endphp
    @foreach($documents as $index => $document)
        @php
            $views = explode(',', $document->view); // Mengubah string 'view' menjadi array
            $userJabatan = auth()->user()->jabatan;
        @endphp
        @if(in_array($userJabatan, $views))
            @if(auth()->user()->jabatan === 'Mahasiswa' || auth()->user()->jabatan === 'Adm')
                @if($document->kategori_dokumen === 'Dokumen Pendidikan')
                    <tr data-category="{{ $document->kategori_dokumen }}">
                        <td>{{ $no++ }}</td>
                        <td>{{ $document->judul_dokumen }}</td>
                        <td>{{ $document->deskripsi_dokumen }}</td>
                        <td>{{ $document->kategori_dokumen }}</td>
                        <td>{{ $document->created_by }}</td>
                        <td>{{ $document->validasi_dokumen }}</td>
                        <td style="max-width: 100px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{ $document->tahun_dokumen }}</td>
                        <td>
                            @if($document->dokumen_file)
                                <a href="{{ asset('storage/documents/' . $document->dokumen_file) }}" target="_blank">
                                    <i class="fa fa-file" aria-hidden="true"></i> 
                                </a>
                            @elseif($document->dokumen_link)
                                <a href="{{ $document->dokumen_link }}" target="_blank">
                                    <i class="fa fa-link" aria-hidden="true"></i> 
                                </a>
                            @endif
                        </td>
                        <td>{{ $document->tags }}</td>
                        <td>{{ $document->view }}</td>
                    </tr>
                @endif
         @php $no = 1; @endphp
            @elseif(auth()->user()->jabatan === 'Dosen')
                @if(in_array($document->kategori_dokumen, ['Dokumen Pendidikan', 'Dokumen Penelitian', 'Dokumen Sumber Daya Manusia']))
                    <tr data-category="{{ $document->kategori_dokumen }}">
                        <td>{{ $no++ }}</td>
                        <td>{{ $document->judul_dokumen }}</td>
                        <td>{{ $document->deskripsi_dokumen }}</td>
                        <td>{{ $document->kategori_dokumen }}</td>
                        <td>{{ $document->created_by }}</td>
                        <td>{{ $document->validasi_dokumen }}</td>
                        <td style="max-width: 100px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{ $document->tahun_dokumen }}</td>
                        <td>
                            @if($document->dokumen_file)
                                <a href="{{ asset('storage/documents/' . $document->dokumen_file) }}" target="_blank">
                                    <i class="fa fa-file" aria-hidden="true"></i> 
                                </a>
                            @elseif($document->dokumen_link)
                                <a href="{{ $document->dokumen_link }}" target="_blank">
                                    <i class="fa fa-link" aria-hidden="true"></i> 
                                </a>
                            @endif
                        </td>
                        <td>{{ $document->tags }}</td>
                        <td>{{ $document->view }}</td>
                    </tr>
                @endif
            @else
                <tr data-category="{{ $document->kategori_dokumen }}">
                    <td>{{ $no++ }}</td>
                    <td>{{ $document->judul_dokumen }}</td>
                    <td>{{ $document->deskripsi_dokumen }}</td>
                    <td>{{ $document->kategori_dokumen }}</td>
                    <td>{{ $document->created_by }}</td>
                    <td>{{ $document->validasi_dokumen }}</td>
                    <td style="max-width: 100px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{ $document->tahun_dokumen }}</td>
                    <td>
                        @if($document->dokumen_file)
                            <a href="{{ asset('storage/documents/' . $document->dokumen_file) }}" target="_blank">
                                <i class="fa fa-file" aria-hidden="true"></i> 
                            </a>
                        @elseif($document->dokumen_link)
                            <a href="{{ $document->dokumen_link }}" target="_blank">
                                <i class="fa fa-link" aria-hidden="true"></i> 
                            </a>
                        @endif
                    </td>
                    <td>{{ $document->tags }}</td>
                    <td>
                        <a href="{{ asset('storage/documents/' . $document->dokumen_file) }}" class="btn btn-link p-0" style="display: inline-block; margin-right: 0.3rem" download>
                            <i class="fa fa-download"></i>
                        </a>
                        <a href="{{ route('dokumen.history', $document->id) }}" class="btn btn-link p-0" style="display: inline-block; margin-right: 0.3rem">
                            <i class="fa fa-history" aria-hidden="true" style="color: blue;"></i>
                        </a>
                    </td>
                    <td>{{ $document->view }}</td>
                </tr>
            @endif
        @endif
    @endforeach
</tbody>



</table>
</div>
</div>
        </div>
    </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const originalRowsOrder = Array.from(document.querySelectorAll('#documentTableBody tr'));
    // Fungsi untuk melakukan pencarian berdasarkan judul dokumen dan tag
    function searchByTitleAndTag() {
        // Mendapatkan nilai input pencarian
        var query = document.getElementById('search').value.trim().toLowerCase();
        
        // Mendapatkan semua baris dalam tabel
        var rows = document.querySelectorAll('#documentTableBody tr');

        // Iterasi melalui setiap baris dalam tabel
        rows.forEach(function(row) {
            // Mendapatkan teks judul dokumen dan tag dalam baris saat ini
            var title = row.cells[1].textContent.trim().toLowerCase();
            var tags = row.cells[7].textContent.toLowerCase();
            var tagArray = tags.split(',').map(tag => tag.trim()); // Memecah string tags menjadi array dan trim setiap tag

            // Memeriksa apakah judul dokumen atau salah satu tag mengandung kata kunci pencarian
            var matchFound = title.includes(query) || tagArray.some(tag => tag.includes(query));

            if (matchFound) {
                // Jika iya, tampilkan baris
                row.style.display = '';
            } else {
                // Jika tidak, sembunyikan baris
                row.style.display = 'none';
            }
        });

        // Log ke konsol setelah pencarian selesai
        console.log('Pencarian selesai. Hasil yang ditampilkan:', query);
    }

    // Event listener untuk menangani pencarian saat tombol atau input diketik
    document.getElementById('search').addEventListener('input', function() {
        searchByTitleAndTag();
    });

    // Event listener untuk menangani pencarian saat tombol search di klik
    document.getElementById('searchIcon').addEventListener('click', function() {
        searchByTitleAndTag();
    });
     // Fungsi untuk melakukan filter berdasarkan kategori dokumen
     function filterByCategory() {
        var selectedCategory = document.getElementById('filter').value.toLowerCase();
        var rows = document.querySelectorAll('#documentTableBody tr');

        rows.forEach(function(row) {
            var category = row.dataset.category.toLowerCase();

            if (selectedCategory === 'all' || category === selectedCategory) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });

        console.log('Filtering by category:', selectedCategory);
    }

    // Event listener untuk pencarian
    document.getElementById('search').addEventListener('input', function() {
        searchByTitleAndTag();
    });

    document.getElementById('searchIcon').addEventListener('click', function() {
        searchByTitleAndTag();
    });

    // Event listener untuk filter
    document.getElementById('filter').addEventListener('change', function() {
        filterByCategory();
    });


    document.getElementById('yearFilter').addEventListener('change', function() {
        const selectedOption = this.value;
        if (selectedOption === 'all') {
            // Jika opsi "Tahun Dokumen" dipilih, panggil fungsi untuk mengembalikan tampilan tabel ke urutan aslinya
            restoreOriginalOrder();
        } else {
            // Jika opsi "Terbaru" atau "Terlama" dipilih, panggil fungsi filterByYear dengan nilai yang sesuai
            filterByYear(selectedOption);
        }
    });

    // Fungsi untuk mengembalikan tampilan tabel ke urutan aslinya
    function restoreOriginalOrder() {
        const tbody = document.getElementById('documentTableBody');
        tbody.innerHTML = ''; // Hapus semua baris yang ada dalam tabel
        originalRowsOrder.forEach(row => tbody.appendChild(row)); // Tambahkan kembali baris-baris urutan asli
    }

    // Fungsi filter tahun
    function filterByYear(type) {
        const rows = document.querySelectorAll('#documentTableBody tr');
        const sortedRows = Array.from(rows).sort(function(rowA, rowB) {
            const yearA = parseInt(rowA.cells[5].textContent); // Kolom tahun adalah indeks ke-5
            const yearB = parseInt(rowB.cells[5].textContent);
            return type === 'newest' ? yearB - yearA : yearA - yearB;
        });

        // Hapus semua baris dari tabel
        rows.forEach(function(row) {
            row.parentNode.removeChild(row);
        });

        // Tambahkan baris yang telah diurutkan kembali ke tabel
        sortedRows.forEach(function(row) {
            document.getElementById('documentTableBody').appendChild(row);
        });

        // Log ke konsol setelah filter selesai
        console.log('Filter tahun:', type);
    }
    $(document).ready(function() {
        $('.show-history').click(function(e) {
            e.preventDefault();
            var documentId = $(this).data('document-id');
            $.ajax({
                url: '/get-document-history/' + documentId,
                type: 'GET',
                success: function(response) {
                    // Tampilkan riwayat dalam modal
                    $('#history-modal .modal-body').html(response);
                    $('#history-modal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });
    function filterByYear(type) {
        const rows = document.querySelectorAll('#documentTableBody tr');
        const sortedRows = Array.from(rows).sort(function(rowA, rowB) {
            const yearA = parseInt(rowA.cells[6].textContent); // Kolom tahun adalah indeks ke-6 (mulai dari 0)
            const yearB = parseInt(rowB.cells[6].textContent);
            return type === 'newest' ? yearB - yearA : yearA - yearB;
        });

        // Hapus semua baris dari tabel
        const tableBody = document.getElementById('documentTableBody');
        tableBody.innerHTML = '';

        // Tambahkan baris yang telah diurutkan kembali ke tabel
        sortedRows.forEach(function(row) {
            tableBody.appendChild(row);
        });

        // Log ke konsol setelah filter selesai
        console.log('Filter tahun:', type);
    }

    document.getElementById('yearFilter').addEventListener('change', function() {
        const filterValue = this.value;
        if (filterValue === 'newest') {
            filterByYear('newest');
        } else if (filterValue === 'oldest') {
            filterByYear('oldest');
        } else {
            // Tampilkan semua baris jika pilihan adalah "all"
            const rows = document.querySelectorAll('#documentTableBody tr');
            rows.forEach(function(row) {
                row.style.display = '';
            });
        }
    });

    $(document).ready(function() {
        $('.show-history').click(function(e) {
            e.preventDefault();
            var documentId = $(this).data('document-id');
            $.ajax({
                url: '/get-document-history/' + documentId,
                type: 'GET',
                success: function(response) {
                    // Tampilkan riwayat dalam modal
                    $('#history-modal .modal-body').html(response);
                    $('#history-modal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });
});

</script>
@endsection