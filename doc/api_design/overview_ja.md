FeelEvent API Document
============

| Date: 2016-09-09 | Author: 1PAC 春菜 紘道 |
|---|---|

## Overview
FeelEvent(WorldSchool) アプリのさまざまな機能を REST 形式の API で提供する。

## 基本情報
- `HTTPS` プロトコルのみを利用
- ホストは `https://worldschool.feelnote.org/`

### エンドポイント
- ex) https://worldschool.feelnote.org/api/API\_PATH

## Request

### Format
- URI クエリを利用してパラメータを指定する
    - ex) ?foo=bar&baz=qux

### Versioning
* バージョン指定はリクエストパラメータ(`api_version`)で指定する
* バージョンの値は `SemanticVersioning` を利用
    * ex) /api/foo?api\_version=1.1.0

### Authentication
* CookieSession 方式

## Response

### Response format
- レスポンスフォーマットは **JSON** 形式
- Content-Type は **application/json**
- JSON のキー名は **スネークケース**
    - ex) publish\_start\_at
- 日付形式は [ISO8601](https://ja.wikipedia.org/wiki/ISO_8601) に準拠
    - ex) 2015-06-12T09:17:45+0900

### Success response
ステータスコード 2xx の成功系レスポンスの説明になります。

#### 200 OK, 201 Created
- 通常の成功時のレスポンス
- 各 API に応じたレスポンスボディを返却します。

```
HTTP/1.1 200 OK
```

or

```
HTTP/1.1 201 Created
```

#### 204 No Content
- 処理は成功(受理)したがレスポンスボディがない場合のレスポンス

```
HTTP/1.1 204 No Content
```

### Error response
例外系(エラー系)レスポンスの説明になります。

#### 401 Unauthorized
- 認証に失敗した時のレスポンス

```
HTTP/1.1 401 Unauthorized
```
```javascript
{"message": "Unauthorized"}
```

#### 403 Forbidden
```
HTTP/1.1 403 Forbidden
```
```javascript
{"message": "Forbidden"}
```

#### 404 Not Found
```
HTTP/1.1 404 Not Found
```
```javascript
{"message": "Not Found"}
```

#### 409 Conflict
- 例) お気に入り登録 API 等を実行した際に既に登録済みの時のレスポンス

```
HTTP/1.1 409 Conflict
```
```javascript
{"message": "Conflict"}
```

#### 422 Unprocessable Entity
- バリデーションエラー時のレスポンス

```
HTTP/1.1 422 Unprocessable Entity
```
```javascript
{
  "message": "Unprocessable Entity",
  "errors": [
    { "name": ["必須項目です", "2文字以上10文字以下で入力してください"] },
    { "email": ["必須項目です"] }
  ]
}
```

#### 500 Internal Server Error

```
HTTP/1.1 500 Internal Server Error
```
```javascript
{"message": "Internal Server Error"}
```

#### 503 Service Unavailable

```
HTTP/1.1 503 Service Unavailable
```
```javascript
{"message": "Service Unavailable"}
```

***
