@extends('layouts.app')

@section('content')
<div class="navigasi" style="margin-top:50px">
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="position:fixed">
            <a class="nav-link" id="v-pills-home-tab" href="{{ route('home') }}" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
            <a class="nav-link active" id="v-pills-profile-tab" href="{{ route('input-dokumen') }}" role="tab" aria-controls="v-pills-profile" aria-selected="false">Input Dokumen</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-dokumen') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Dokumen</a>
            <a class="nav-link" id="v-pills-user-documents-tab" href="{{ route('list-dokumen-user') }}" role="tab" aria-controls="v-pills-user-documents" aria-selected="false">Dokumen Saya</a>
            <a class="nav-link" id="v-pills-deleted-documents-tab" href="{{ route('draft-dokumen') }}" role="tab" aria-controls="v-pills-deleted-documents" aria-selected="false">Deleted Dokumen</a>
            @if(auth()->check() && auth()->user()->approved && (auth()->user()->jabatan === 'Admin' || auth()->user()->jabatan === 'Kaprodi'))
                <a class="nav-link" id="v-pills-category-tab" href="{{ route('kategori-dokumen.index') }}" role="tab" aria-controls="v-pills-category" aria-selected="false">List Kategori</a>
                <a class="nav-link" id="v-pills-roles-tab" href="{{ route('jabatan.index') }}" role="tab" aria-controls="v-pills-roles" aria-selected="false">List Jabatan</a>
                <a class="nav-link" id="v-pills-validation-tab" href="{{ route('validasi-dokumen.index') }}" role="tab" aria-controls="v-pills-validation" aria-selected="false">List Validasi</a>
                <a class="nav-link" id="v-pills-user-list-tab" href="{{ route('list-user') }}" role="tab" aria-controls="v-pills-user-list" aria-selected="false">List User</a>
            @endif
        </div>
        <div class="form-label" id="v-pills-tabContent" style="margin-left: 200px; width: calc(100% - 200px);">
            <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <h3 class="mt-3 mb-3">Input Dokumen</h3>
                <form action="{{ route('simpan-dokumen') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @if(session('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{ session('success') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    @endif
                    <div>
                        <img src="{{ asset('images/gambar2.png') }}" alt="gambar" style="position:absolute; top:7%; left:600px; opacity:0.2; max-width: 110%; height: 600px">
                    </div>
                    <div>
                        <label>Judul Dokumen:</label>
                        <input class="form-control" name="judul_dokumen" required>
                    </div>

                    <div>
                        <label style="margin-top:10px">Deskripsi Dokumen:</label>
                        <input class="form-control" name="deskripsi_dokumen">
                    </div>
                    <div>
                        <label>Kategori Dokumen:</label>
                        <select name="kategori_dokumen" id="kategoriDokumen" class="form-control" required>
                            <option value="">Memuat...</option>
                        </select>
                    </div>

                    <div>
    <label>Validasi Dokumen:</label>
    <select name="validasi_dokumen" id="validasiDokumen" class="form-control" required>
        <option value="">Memuat...</option>
    </select>
</div>


                    <div>
                        <label for="tahunDokumen" style="margin-top:10px">Tahun Dokumen:</label>
                        <input type="number" class="form-control" name="tahun_dokumen" id="tahunDokumen" style="position:relative; z-index: 1;" min="1900" max="2100" required>
                    </div>

                    <div>
    <label for="inputType">Tipe Dokumen:</label>
    <select id="inputType" class="form-select" name="inputType" required onchange="toggleInputFields()">
        <option value="file" @isset($inputType) {{ $inputType === 'file' ? 'selected' : '' }} @endisset>File</option>
        <option value="link" @isset($inputType) {{ $inputType === 'link' ? 'selected' : '' }} @endisset>Link</option>
    </select>
</div>

<div id="fileInput" style="{{ isset($inputType) && $inputType === 'file' ? '' : 'display:none;' }}">
    <label for="formFile">Input File Dokumen:</label>
    <input class="form-control" type="file" id="formFile" name="dokumen_file">
</div>

<div id="linkInput" class="mb-3" style="{{ isset($inputType) && $inputType === 'link' ? '' : 'display:none;' }}">
    <label for="formLink">Input Link Dokumen:</label>
    <input class="form-control" type="url" id="formLink" name="dokumen_link">
</div>
                    <div>
                        <label for="tags">Tags:</label>
                        <input type="text" id="tags" name="tags" data-role="tagsinput" class="form-control" placeholder="Add tags" required>
                    </div>

                    <div>
                        <label for="permissions" style="margin-top:10px">Izinkan siapa saja yang melihat: </label>
                        <div class="d-flex flex-wrap">
                        @isset($jabatanList)
                            @foreach ($jabatanList as $jabatan)
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="permissions[]" value="{{ $jabatan }}" id="{{ $jabatan }}" {{ in_array($jabatan, old('permissions', [])) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="{{ $jabatan }}">
                                        {{ $jabatan }}
                                    </label>
                                </div>
                            @endforeach
                            @endisset
                        </div>
                    </div>

                    <div>
                        <label for="User" style="margin-top:10px">User:</label>
                        <input type="text" id="User" name="Create_by" class="form-control" placeholder="User" required disabled>
                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-top:10px">Submit</button>
                    <button type="button" id="cancelButton" class="btn btn-secondary" style="margin-left:10px; margin-top:10px">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    function toggleInputFields() {
        var inputType = document.getElementById('inputType').value;
        if (inputType === 'file') {
            document.getElementById('fileInput').style.display = 'block';
            document.getElementById('linkInput').style.display = 'none';
        } else if (inputType === 'link') {
            document.getElementById('fileInput').style.display = 'none';
            document.getElementById('linkInput').style.display = 'block';
        }
    }

    toggleInputFields(); // Call once to initialize based on the current selection
    document.getElementById('inputType').addEventListener('change', toggleInputFields);
});

    // Fetch and populate user name
    fetch('/get-user-name')
        .then(response => response.json())
        .then(data => {
            localStorage.setItem('user_active', data.name);

            // Ambil nama pengguna dari local storage
            var userName = localStorage.getItem('user_active');
            
            // Set nilai input dengan id 'Create_by' menjadi nilai nama pengguna dari local storage
            if (userName) {
                document.getElementById('User').value = userName; // Menggunakan 'User' sebagai id input
            }
        });

    document.addEventListener('DOMContentLoaded', function () {
        const allCheckbox = document.getElementById('all');
        const checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#all)');

        allCheckbox.addEventListener('change', function () {
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                if (!this.checked) {
                    allCheckbox.checked = false;
                } else if (document.querySelectorAll('input[type="checkbox"]:not(#all):checked').length === checkboxes.length) {
                    allCheckbox.checked = true;
                }
            });
        });
        });

        document.addEventListener('DOMContentLoaded', function() {
        fetch('{{ route('kategori-dokumen') }}')
            .then(response => response.json())
            .then(data => {
                const kategoriDokumenSelect = document.getElementById('kategoriDokumen');
                kategoriDokumenSelect.innerHTML = '<option value="">Pilih Kategori Dokumen</option>'; // Reset options

                data.forEach(item => {
                    const option = document.createElement('option');
                    option.value = item.nama_dokumen;
                    option.textContent = item.nama_dokumen;
                    kategoriDokumenSelect.appendChild(option);
                });
            })
            .catch(error => {
                console.error('Error fetching kategori dokumen:', error);
                const kategoriDokumenSelect = document.getElementById('kategoriDokumen');
                kategoriDokumenSelect.innerHTML = '<option value="">Error memuat data</option>';
            });
    });

     // Fetch and populate validation options
     fetch('{{ route('get-validasi-dokumen') }}')
        .then(response => response.json())
        .then(data => {
            const validasiDokumenSelect = document.getElementById('validasiDokumen');
            validasiDokumenSelect.innerHTML = '<option value="">Pilih Validasi Dokumen</option>';
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item;
                option.textContent = item;
                validasiDokumenSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error fetching validasi dokumen:', error);
            const validasiDokumenSelect = document.getElementById('validasiDokumen');
            validasiDokumenSelect.innerHTML = '<option value="">Error memuat data</option>';
        });

    // Checkbox for selecting all permissions
    const allCheckbox = document.getElementById('all');
    const checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#all)');

    allCheckbox.addEventListener('change', function() {
        checkboxes.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            if (!this.checked) {
                allCheckbox.checked = false;
            } else if (document.querySelectorAll('input[type="checkbox"]:not(#all):checked').length === checkboxes.length) {
                allCheckbox.checked = true;
            }
        });
    });
</script>
@endsection