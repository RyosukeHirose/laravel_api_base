<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Shop;
use App\Common\Common;
use Illuminate\Support\Facades\Auth;


class RegisterController extends Controller
{
    public function register(Request $request)
    {
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

    public function shopRegister(Request $request)
    {
        logger('qqqqqqq');
        // バリデーション
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|unique:shops|max:255',
            'password' => 'required|confirmed|min:8',
        ]);

        // 新しいShopを作成
        $shop = Shop::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => bcrypt($validatedData['password']),
        ]);
        $credentials = $request->only([$validatedData['email'], $validatedData['password']]);
        Auth::guard('shops')->attempt($credentials);
        // ログイン処理
        // auth()->login($shop);
        // return json response
        return Common::jsonOut(0, Auth::user());
    }
}
