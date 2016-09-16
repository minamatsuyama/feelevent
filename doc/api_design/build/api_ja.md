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

## <a name="resource-favorite"></a>ID:A01 イベントお気に入り

イベントのお気に入り情報

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **count** | *integer* | お気に入り数 | `999` |
| **event_item_id** | *integer* | イベントID | `123` |

***

### ID:A0101 イベントお気に入り:登録

お気に入りを登録する

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
HTTP/1.1 200 OK
```

```json
{
  "event_item_id": 123,
  "count": 999
}
```

***

### ID:A0102 イベントお気に入り:削除

お気に入りを削除する

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


## <a name="resource-events"></a>ID:A02 イベント

イベント情報

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **data/entry_ended_at** | *string* | 申込締切日 | `"2016-03-19T12:34:56+0900"` |
| **data/entry_fee** | *array* | 参加費(無料:free, 有料:pay) | `{"value":"free","text":"無料"}` |
| **data/event_type** | *array* | 種別(参加型: participatory, 講義型: lecture, 評価型: evaluation) | `{"value":"participatory","text":"参加型"}` |
| **data/favorite_count** | *integer* | お気に入り数 | `123` |
| **data/favorited** | *boolean* | お気に入りフラグ(ログイン時に有効)<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/held_areas** | *array* | 開催場所(TODO: 関西:kansai, 関東:kanto, 海外:overseas) | `[{"value":"kanto","text":"関東"},{"value":"kansai","text":"関西"}]` |
| **data/held_ended_at** | *string* | 開催終了日 | `"2016-08-12T09:17:45+0900"` |
| **data/held_started_at** | *string* | 開催開始日 | `"2016-05-01T09:03:02+0900"` |
| **data/id** | *integer* | ID | `344` |
| **data/index_image** | *string* | 一覧用画像 | `"http://dummyimage.com/300x200/ccc/fff.jpg"` |
| **data/keywords** | *array* | キーワード | `[{"id":100,"name":"コミュニケーション"},{"id":102,"name":"アート"},{"id":233,"name":"ビジネス"}]` |
| **data/preparation_type** | *array* | 事前準備(準備不要: needless、個人で: individual準備、チームで準備: team) | `{"value":"needless","text":"準備不要"}` |
| **data/recommended** | *boolean* | リコメンドフラグ<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/reviewed** | *boolean* | 口コミフラグ<br/> **pattern:** <code>(true&#124;false)</code> | `true` |
| **data/title** | *string* | イベントタイトル | `"イベントのタイトル"` |
| **pagination:current_page** | *integer* | 現ページ番号 | `2` |
| **pagination:next_page** | *integer* | 次のページ (ページが存在しない場合は null) | `3` |
| **pagination:per_page** | *integer* | 1ページの件数 | `20` |
| **pagination:prev_page** | *integer* | 前のページ (ページが存在しない場合は null) | `1` |
| **pagination:total_count** | *integer* | 記事総数 | `100` |

***

### ID:A0201 イベント:検索

イベント情報を検索する

```
GET /api/events
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **entry_fee** | *string* | 参加費(無料:free, 有料:pay)<br/> **pattern:** <code>(pay&#124;free)</code> | `"free"` |
| **event_types** | *array* | 種別(参加型: participatory, 講義型: lecture, 評価型: evaluation)<br/> **pattern:** <code>(participatory&#124;lecture&#124;evaluation)</code> | `["participatory","evaluation"]` |
| **held_area** | *string* | 開催場所(TODO: 関西:kansai, 関東:kanto, 海外:overseas) | `"kanto"` |
| **held_ended_on** | *string* | 開催終了日 | `"2016-03-03"` |
| **held_started_on** | *string* | 開催開始日 | `"2016-01-02"` |
| **keyword_ids** | *array* | キーワードID(FeelnoteDBのkeywords.id) | `[100,102]` |
| **page** | *integer* | **ページ指定** (存在しないページが指定された時は0件とする)<br/> **default:** `1` | `2` |
| **per_page** | *integer* | **1ページ件数**<br/> **default:** `5`<br/> **Range:** `1 <= value <= 20` | `5` |
| **qualifying_age_id** | *integer* | 対象年齡(event_qualifying_ages.id) | `33` |
| **word** | *string* | フリーワード | `"サッカー"` |


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
  -d word=%E3%82%B5%E3%83%83%E3%82%AB%E3%83%BC \
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
      "title": "イベントのタイトル",
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
          "name": "コミュニケーション"
        },
        {
          "id": 102,
          "name": "アート"
        },
        {
          "id": 233,
          "name": "ビジネス"
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

### ID:A0202 イベント:お気に入り一覧

イベントお気に入り情報の一覧を取得する

```
GET /api/events/favorites
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **page** | *integer* | **ページ指定** (存在しないページが指定された時は0件とする)<br/> **default:** `1` | `2` |
| **per_page** | *integer* | **1ページ件数**<br/> **default:** `5`<br/> **Range:** `1 <= value <= 20` | `5` |


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
      "title": "イベントのタイトル",
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
          "name": "コミュニケーション"
        },
        {
          "id": 102,
          "name": "アート"
        },
        {
          "id": 233,
          "name": "ビジネス"
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
