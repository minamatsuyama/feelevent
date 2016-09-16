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

## <a name="resource-favorite"></a>ID:A01 Event yêu thích

Thông tin event yêu thích

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **count** | *integer* | Số lượng event yêu thích | `999` |
| **event_item_id** | *integer* | Event id | `123` |

***

### ID:A0101 Event yêu thích:Đăng kí

Luư vào danh sách yêu thích

```
POST /api/events/{event_item_id}/favorites
```


#### Curl Example

```bash
$ curl -n -X POST https://worldschool.feelnote.org/api/events/$EVENT_ITEM_ID/favorites \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "event_item_id": 123,
  "count": 999
}
```

***

### ID:A0102 Event yêu thích:Xoá

Xoá khỏi danh sách yêu thích

```
DELETE /api/events/{event_item_id}/favorites
```


#### Curl Example

```bash
$ curl -n -X DELETE https://worldschool.feelnote.org/api/events/$EVENT_ITEM_ID/favorites \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "event_item_id": 123,
  "count": 999
}
```


## <a name="resource-events"></a>ID:A02 Event

Thông tin Event

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **data/entry_ended_at** | *string* | Ngày hết hạn đăng kí (申込締切日) | `"2016-03-19T12:34:56+0900"` |
| **data/entry_fee** | *array* | Lệ phí(無料:free, 有料:pay) | `{"value":"free","text":"無料"}` |
| **data/event_type** | *array* | Hình thức(参加型: participatory, 講義型: lecture, 評価型: evaluation) | `{"value":"participatory","text":"参加型"}` |
| **data/favorite_count** | *integer* | Số lượng Event yêu thích | `123` |
| **data/favorited** | *boolean* | Favorite flag(Chỉ có true khi đang login)<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/held_areas** | *array* | Địa điểm tổ chức(TODO: 関西:kansai, 関東:kanto, 海外:overseas) | `[{"value":"kanto","text":"関東"},{"value":"kansai","text":"関西"}]` |
| **data/held_ended_at** | *string* | Ngày kết thúc tổ chức (開催終了日) | `"2016-08-12T09:17:45+0900"` |
| **data/held_started_at** | *string* | Ngày bắt đầu tổ chức (開催開始日) | `"2016-05-01T09:03:02+0900"` |
| **data/id** | *integer* | ID | `344` |
| **data/index_image** | *string* | Hình ảnh dùng cho trang index | `"http://dummyimage.com/300x200/ccc/fff.jpg"` |
| **data/keywords** | *array* | Keyword | `[{"id":100,"name":"Communication"},{"id":102,"name":"アート"},{"id":233,"name":"Business"}]` |
| **data/preparation_type** | *array* | Yêu cầu chuẩn bị trước(準備不要: needless、個人で: individual準備、チームで準備: team) | `{"value":"needless","text":"準備不要"}` |
| **data/recommended** | *boolean* | Recommendation flag<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/reviewed** | *boolean* | WoM flag<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/title** | *string* | Event title | `"This is event title"` |
| **pagination:current_page** | *integer* | Trang hiện tại (current page) | `2` |
| **pagination:next_page** | *integer* | Trang kế tiếp (nếu không có sẽ có giá trị null) | `3` |
| **pagination:per_page** | *integer* | Số lượng event cho mỗi trang | `20` |
| **pagination:prev_page** | *integer* | Trang trước (nếu không có sẽ có giá trị null) | `1` |
| **pagination:total_count** | *integer* | Tổng số event | `100` |

***

### ID:A0201 Event:Tìm kiếm

Tìm kiếm thông tin Event

```
GET /api/events
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **entry_fee** | *string* | Phí tham gia(無料:free, 有料:pay)<br/> **pattern:** <code>(pay&#124;free)</code> | `"free"` |
| **event_types** | *array* | Hình thức (参加型: participatory, 講義型: lecture, 評価型: evaluation)<br/> **pattern:** <code>(participatory&#124;lecture&#124;evaluation)</code> | `["participatory","evaluation"]` |
| **held_area** | *string* | Địa điểm tổ chức(TODO: 関西:kansai, 関東:kanto, 海外:overseas) | `"kanto"` |
| **held_ended_on** | *string* | Ngày kết thúc Event / 開催終了日 | `"2016-03-03"` |
| **held_started_on** | *string* | Ngày bắt đầu Event / 開催開始日 | `"2016-01-02"` |
| **keyword_ids** | *array* | Keyword id(FeelnoteDBのkeywords.id) | `[100,102]` |
| **page** | *integer* | **Chỉ định trang** (Nếu trang chỉ định không tồn tại trả về số trang là 0)<br/> **default:** `1` | `2` |
| **per_page** | *integer* | **số event mỗi trang**<br/> **default:** `5`<br/> **Range:** `1 <= value <= 20` | `5` |
| **qualifying_age_id** | *integer* | Lứa tuổi (event_qualifying_ages.id) | `33` |
| **word** | *string* | Từ khoá tự do | `"soccer"` |


#### Curl Example

```bash
$ curl -n https://worldschool.feelnote.org/api/events
 -G \
  -d keyword_ids[]=100 \
  -d keyword_ids[]=102 \
  -d event_types[]=participatory \
  -d event_types[]=evaluation \
  -d held_area=kanto \
  -d held_started_on=2016-01-02 \
  -d held_ended_on=2016-03-03 \
  -d entry_fee=free \
  -d qualifying_age_id=33 \
  -d word=soccer \
  -d page=2 \
  -d per_page=5
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "pagination": {
    "current_page": 2,
    "next_page": 3,
    "prev_page": 1,
    "per_page": 20,
    "total_count": 100
  },
  "data": [
    {
      "id": 344,
      "title": "This is event title",
      "event_type": {
        "value": "participatory",
        "text": "参加型"
      },
      "preparation_type": {
        "value": "needless",
        "text": "準備不要"
      },
      "index_image": "http://dummyimage.com/300x200/ccc/fff.jpg",
      "entry_fee": {
        "value": "free",
        "text": "無料"
      },
      "held_started_at": "2016-05-01T09:03:02+0900",
      "held_ended_at": "2016-08-12T09:17:45+0900",
      "entry_ended_at": "2016-03-19T12:34:56+0900",
      "held_areas": [
        {
          "value": "kanto",
          "text": "関東"
        },
        {
          "value": "kansai",
          "text": "関西"
        }
      ],
      "keywords": [
        {
          "id": 100,
          "name": "Communication"
        },
        {
          "id": 102,
          "name": "アート"
        },
        {
          "id": 233,
          "name": "Business"
        }
      ],
      "recommended": true,
      "reviewed": true,
      "favorite_count": 123,
      "favorited": true
    }
  ]
}
```

***

### ID:A0202 Event:Danh sách Event yêu thích

Lấy thông tin danh sách Event yêu thích

```
GET /api/events/favorites
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **page** | *integer* | **Chỉ định trang** (Nếu trang chỉ định không tồn tại trả về số trang là 0)<br/> **default:** `1` | `2` |
| **per_page** | *integer* | **số event mỗi trang**<br/> **default:** `5`<br/> **Range:** `1 <= value <= 20` | `5` |


#### Curl Example

```bash
$ curl -n https://worldschool.feelnote.org/api/events/favorites
 -G \
  -d page=2 \
  -d per_page=5
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "pagination": {
    "current_page": 2,
    "next_page": 3,
    "prev_page": 1,
    "per_page": 20,
    "total_count": 100
  },
  "data": [
    {
      "id": 344,
      "title": "This is event title",
      "event_type": {
        "value": "participatory",
        "text": "参加型"
      },
      "preparation_type": {
        "value": "needless",
        "text": "準備不要"
      },
      "index_image": "http://dummyimage.com/300x200/ccc/fff.jpg",
      "entry_fee": {
        "value": "free",
        "text": "無料"
      },
      "held_started_at": "2016-05-01T09:03:02+0900",
      "held_ended_at": "2016-08-12T09:17:45+0900",
      "entry_ended_at": "2016-03-19T12:34:56+0900",
      "held_areas": [
        {
          "value": "kanto",
          "text": "関東"
        },
        {
          "value": "kansai",
          "text": "関西"
        }
      ],
      "keywords": [
        {
          "id": 100,
          "name": "Communication"
        },
        {
          "id": 102,
          "name": "アート"
        },
        {
          "id": 233,
          "name": "Business"
        }
      ],
      "recommended": true,
      "reviewed": true,
      "favorite_count": 123
    }
  ]
}
```


***
©1PAC. INC.
