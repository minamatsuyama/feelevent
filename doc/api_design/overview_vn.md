FeelEvent API Document
============

| Date: 2016-09-09 | Author: 1PAC Hiromichi Haruna |
|---|---|

## Khái quát
Cung cấp các chức năng của FeelEvent (World School) qua API dạng REST.

## Thông tin cơ bản
- Chỉ sử dụng protocol `HTTPS`
- Địa chỉ host `https://worldschool.feelnote.org/`

### Endpoint
- ex) https://worldschool.feelnote.org/api/API\_PATH

## Request

### Format
- Chỉ định các parameter bằng URI query
    - Ví dụ: ?foo=bar&baz=qux

### Quản lý phiên bản(Versioning)
* Chỉ định phiên bản thông qua parameter (`api_version`)
* Giá trị của version chỉ định dưới dạng `SemanticVersioning`
    * Ví dụ: /api/foo?api\_version=1.1.0

### Định danh (Authentication)
* Sử dụng CookieSession

## Response

### Response format
- Định dạng của response là **JSON**
- Content-Type là **application/json**
- Key của JSON viết dưới dạng **snake_case**
    - Ví dụ: publish\_start\_at
- Định dạng của ngày giờ theo chuẩn [ISO8601](https://ja.wikipedia.org/wiki/ISO_8601)
    - Ví dụ: 2015-06-12T09:17:45+0900

### Success response
ステータスコード 2xx の成功系レスポンスの説明になります。
Dưới đây là hướng dẫn về những reponse có mã trạng thái (status code) là 2xx.

#### 200 OK, 201 Created
- Response khi xử lý thành công
- Tuỳ API mà sẽ có nội dung body khác nhau.

```
HTTP/1.1 200 OK
```

or

```
HTTP/1.1 201 Created
```

#### 204 No Content
- Xử lý thành công (hoặc đã nhận yêu cầu) nhưng body của response ko có nội dung

```
HTTP/1.1 204 No Content
```

### Error response
Dưới đây là hướng dẫn về các response khi có lỗi.

#### 401 Unauthorized
- Response khi định danh (authorization) không thành công.

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
- Ví dụ: Response khi API đăng kí event yêu thích (Register favorite event) đăng kí event đã được lưu trước đó

```
HTTP/1.1 409 Conflict
```
```javascript
{"message": "Conflict"}
```

#### 422 Unprocessable Entity
- Response khi có lỗi trong kiểm tra giá trị (validation)

```
HTTP/1.1 422 Unprocessable Entity
```
```javascript
{
  "message": "Unprocessable Entity",
  "errors": [
    { "name": ["必須項目です (Required)", "2文字以上10文字以下で入力してください (must be at least 2 characters and maximum 10 characters)"] },
    { "email": ["必須項目です (Required)"] }
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
