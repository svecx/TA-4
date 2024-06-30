@extends('layouts.app')

@section('content')
<div class="navigasi" style="margin-top: 50px">
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="position:fixed">
            <a class="nav-link" id="v-pills-home-tab" href="{{ route('home') }}" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
            <a class="nav-link" id="v-pills-profile-tab" href="{{ route('input-dokumen') }}" role="tab" aria-controls="v-pills-profile" aria-selected="false">Input Dokumen</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-dokumen') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Dokumen</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-dokumen-user') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">Dokumen Saya</a>
            <a class="nav-link" id="v-pills-messages-tab" href="{{ route('draft-dokumen') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">Deleted Dokumen</a>
            @if(auth()->check() && auth()->user()->approved && (auth()->user()->jabatan === 'Admin' || auth()->user()->jabatan === 'Kaprodi'))
                <a class="nav-link active" id="v-pills-messages-tab" href="{{ route('kategori-dokumen.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Kategori</a>
                <a class="nav-link" id="v-pills-messages-tab" href="{{ route('jabatan.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Jabatan</a>
                <a class="nav-link" href="{{ route('validasi-dokumen.index') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List Validasi </a>
                <a class="nav-link" id="v-pills-messages-tab" href="{{ route('list-user') }}" role="tab" aria-controls="v-pills-messages" aria-selected="false">List User</a>
            @endif
        </div>
        <div class="form-label" id="v-pills-tabContent" style="margin-left: 200px; width: calc(100% - 150px);">
            <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <h3 style="margin-top:20px">List Kategori Dokumen</h3>
                <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addModal" style="margin-top:10px;">
                    <i class="fas fa-plus"></i> Tambah Kategori Dokumen
                </button>
                <div class="container-fluid mt-3">
                    @if(session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif

                    <table class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama Dokumen</th>
                                <th style="width: 10.5rem;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($kategoriDokumen as $kategori)
                                <tr>
                                    <td>{{ $kategori->id }}</td>
                                    <td>{{ $kategori->nama_dokumen }}</td>
                                    <td>
                                        <a href="{{ route('kategori-dokumen.edit', $kategori->id) }}" class="btn btn-warning">Edit</a>
                                        <form action="{{ route('kategori-dokumen.destroy', $kategori->id) }}" method="POST" style="display:inline-block;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Modal untuk tambah Kategori -->
                <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <form action="{{ route('kategori-dokumen.store') }}" method="POST">
                            @csrf
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addModalLabel">Tambah Kategori Dokumen</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="nama_dokumen">Nama Kategori Dokumen</label>
                                        <input type="text" class="form-control" id="nama_dokumen" name="nama_dokumen" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
