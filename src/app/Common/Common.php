<?php

namespace App\Common;


use Illuminate\Http\JsonResponse;

class Common
{
    public static function jsonOut($status, $result, $addMessage = null): JsonResponse
    {
        $responseStatusCode = 200;
        switch ($status) {
            case 0:
                $responseStatusCode = 200;
                $message = '正常';
                break;
            case -1:
                $responseStatusCode = 422;
                $message = '通信エラー';
                break;
            case -2:
                $responseStatusCode = 422;
                $message = 'デバイスエラー';
                break;
            case -3:
                $responseStatusCode = 422;
                $message = 'データエラー';
                break;
            case -4:
                $responseStatusCode = 422;
                $message = 'プログラムエラー';
                break;
            case -5:
                $responseStatusCode = 422;
                $message = 'タイムアウトエラー';
                break;
            case -6:
                $responseStatusCode = 401;
                $message = '認証エラー';
                break;
            case -10:
                $responseStatusCode = 422;
                $message = '原因不明エラー';
                break;
            default:
                $responseStatusCode = 200;
        }

        $outResult = (is_array($result))
            ? [
                'status' => $status,
                'message' => $addMessage ?? $message,
                'result' => mb_convert_encoding($result, 'UTF-8', 'UTF-8'),
            ]
            : [
                'status' => $status,
                'message' => $addMessage ?? $message,
                'result' => $result,
            ];

        return response()->json($outResult, $responseStatusCode);
    }
}
