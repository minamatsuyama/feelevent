# API設計 README

## Overview
本プロジェクトでは `JSON Schema` を用いて API のリクエスト/レスポンスの設計を行っています。  
yml ファイルで設計を行い、 `Ruby` の `prmd` Gem を用いて Markdown ドキュメントを生成しています。

## System requirement
* Ruby 2.3.1
* prmd (Gem)


## Setup
下記コマンドで必要な Gem をインストールします

* `bundle install --path vendor/bundle -j4 --binstubs=vendor/bin`


## Directory structure

~~~~bash
.
├── Gemfile
├── Gemfile.lock
├── build/             # 自動生成ファイル出力先ディレクトリ
│   ├── api_ja.json    # schemata_ja/配下を連結して生成したJSON Schemaファイル
│   ├── api_ja.md      # schemata_ja/配下を連結して生成したMarkdownドキュメント
│   ├── api_vi.json    # schemata_vi/配下を連結して生成したJSON Schemaファイル
│   ├── api_vi.md      # schemata_vi/配下を連結して生成したMarkdownドキュメント
│   └── unit/          # schemata_*/配下をファイル単位で生成したMarkdownドキュメント
│       └── ja/
│       │  └── foo.md
│       └── vi/
│           └── foo.md
├── build.sh            # ドキュメント
├── meta_ja.yml         # 日本語用メタ情報
├── meta_vi.yml         # ベトナム語用メタ情報
├── overview_ja.md      # 日本語用のドキュメント生成時に差し込むテンプレ
├── overview_vi.md      # ベトナム語用のドキュメント生成時に差し込むテンプレ
├── overview_unit_ja.md # 日本語用の単体ドキュメント生成時に差し込むテンプレ
├── overview_unit_vi.md # ベトナム語用の単体ドキュメント生成時に差し込むテンプレ
├── schemata_ja/        # 日本語用の元データディレクトリ
│   └── foo.yml
├── schemata_vi/        # ベトナム語用の元データディレクトリ
│   └── foo.yml
└── templates/          # ドキュメント生成時のテンプレ

~~~~

## How to generate

### 通常パターン
下記のように引数無しで `build.sh` を実行すると日本語ファイルの全ファイル連結版と全ファイルの単体版すべてのドキュメントを生成します。

* `./build.sh`

### 言語指定
生成するドキュメントの言語を指定する場合は `DOC_LANG` 変数で指定します。

* `DOC_LANG=vi ./build.sh`

### ファイル指定
管理するファイルが増えてくると生成に時間がかかるため、
`TARGET` 変数でファイルを指定し生成ファイル数を絞ることで処理時間を短縮できます。

* `TARGET=foo ./build.sh`
* 上記例の場合は `schemata_ja/foo.yml` のみを生成します。



