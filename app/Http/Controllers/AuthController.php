<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Str;
use App\Events\NewUserCreated;
class AuthController extends Controller
{
    
    public function register(Request $request){

        $fiels=$request->all();

        $errors=Validator::make($fiels,[
            'email'=>'required|email|unique:users,email',
            'password'=>'required|min:6|max:8',
        ]);

        if($errors->fails()){
            return response($errors->errors()->all(),422);
        }

       $user= User::create([
            'email' => $fiels['email'],
            'password' => bcrypt($fiels['password']),
            'isValidEmail' => User::IS_INVALID_EMAIL,
            'remember_token'=>$this->generateRandomCode()
        ]);

        NewUserCreated::dispatch($user);

        return response(['user'=>$user,'message'=>'user created'],200);

    }

    public function validEmail($token){

        User::where('remember_token',$token)
        ->update(['isValidEmail'=>User::IS_VALID_EMAIL]);

        return redirect('/login');
    }

    function generateRandomCode()
    {
      $code = Str::random(10) . time();
      return $code;
    }
}
