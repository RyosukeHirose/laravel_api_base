<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Common\Common;


class RegisterController extends Controller
{
    public function register(Request $request)
    {
        logger('aaaaaaaa');
        // バリデーション
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|unique:users|max:255',
            'password' => 'required|confirmed|min:8',
        ]);

        // 新しいユーザーを作成
        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => bcrypt($validatedData['password']),
        ]);

        // ログイン処理
        auth()->login($user);

        // return json response
        return Common::jsonOut(0, $user);
    }
}
