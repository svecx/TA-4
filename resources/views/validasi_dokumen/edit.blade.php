@extends('layouts.app')

@section('content')

        </div>
    <h2>Edit Validasi Dokumen</h2>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('validasi-dokumen.update', $validasiDokumen->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div>
            <label for="validasi_dokumen" style="display: inline-block; text-align: left;">Nama Validasi Dokumen</label>
            <input  type="text" class="form-control" id="validasi_dokumen" name="validasi_dokumen" value="{{ $validasiDokumen->validasi_dokumen }}" required>
        </div>
        <button  type="submit" class="btn btn-primary" style="margin-left:200px">Update</button>
    </form>

@endsection
