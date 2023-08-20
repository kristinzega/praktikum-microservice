<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\ApiResource;
use Illuminate\Support\Facades\Hash;
use Auth;
use Validator;
use App\Models\User;

class AuthController extends Controller {
// Method For User Register token
public function register(Request $request)
{
    $validator = Validator::make($request->all(),[
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8'
    ]);

    if($validator->fails()){
        return response()->json($validator->errors());
    }

    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password)
    ]);

    $token = $user->createToken('auth_token')->plainTextToken;
    return new ApiResource(true, 'Register Berhasil',
            ['User' =>$user, 'access_token'=>$token, 'token_type' => 'Bearer']);
}

// Method For User Login token
public function login(Request $request)
{
    if (!Auth::attempt($request->only('email', 'password')))
    {
        return response()
            ->json(['message' => 'Unauthorized'], 401);
    }
    $user = User::where('email', $request['email'])->firstOrFail();
    $token = $user->createToken('auth_token')->plainTextToken;
    return new ApiResource(true, 'Hi '.$user->name.', welcome to home',
            ['User' =>$user,'access_token'=>$token, 'token_type' => 'Bearer']);
}

// Method for User Logout and Delete token
public function logout()
{
    auth()->user()->tokens()->delete();
    return response()->json([
        'success' => true,
        'message' => 'You have successfully logged out and the token was successfully deleted'
    ], 200);
}
}
