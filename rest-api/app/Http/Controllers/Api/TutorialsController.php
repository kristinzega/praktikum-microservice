<?php

namespace App\Http\Controllers\Api;
use App\Models\Tutorials;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\ApiResource;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\{Auth, Storage};

class TutorialsController extends Controller
{
    //
    public function index()
    {
        // get tutorials
        $tutorials = Post::latest()->paginate(5);
        // return collection of posts as a resource
        return new ApiResource(true, 'List Data Tutorial', $tutorials);
    }

    public function store(Request $request)
    {
        // Definisi validation rules
        $validator = Validator::make($request->all(), [
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'title' => 'required',
            'published' => 'required',
            'description' => 'required'
        ]);
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        // Upload Image
        $image = $request->file('image');
        $image->storeAs('public/tutorials', $image->hashName());
        // Simpan Data
        $store = Tutorials::create([
            'image' => $image->hashName(),
            'title' => $request->title,
            'published' => $request->published,
            'description' => $request->description,
            'id_user' => Auth::user()->id
        ]);
        // return response
        return new ApiResource(true, 'Data Tutorials Berhasil Ditambahkan!', $store);
    }
    // Menampilkan Data Berdasarkan ID
    public function show($id)
    {
        $data = Tutorials::find($id);
        if (is_null($data)) {
            // Jika ID tidak ditemukan dalam tabel
            return new ApiResource(false, 'Data tidak ditemukan', $data);
        }
        return new ApiResource(true, 'Details Data!', $data);
    }

    // Update Data
    public function update(Request $request, Tutorials $tutorials)
    {
        // define validation rules
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'description' => 'required',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        if ($request->hasFile('image')) {
            // upload image
            $image = $request->file('image');
            $image->storeAs('public/tutorials', $image->hashName());
            // Delete old image
            Storage::delete('public/tutorials/'.$tutorials->image);

            // Update dengan image baru
            $tutorials->update([
                'image' => $image->hashName(),
                'title' => $request->title,
                'published' => $request->published,
                'description' => $request->description
            ]);
            
        } else {
            // Update tanpa Image
            $tutorials->update([
                'title' => $request->title,
                'published' => $request->published,
                'description' => $request->description
            ]);
        }
        return new ApiResource(true, 'Perubahan Data Tutorials Sudah Berhasil!', $tutorials);
    }

    public function destroy(Tutorials $tutorials)
    {
        // delete image
        Storage::delete('public/tutorials/'.$tutorials->image);
        // Delete data dalam tabel
        $tutorials->delete();
        return new ApiResource(true, 'Data telah berhasil dihapus!', $tutorials);
    }
}
