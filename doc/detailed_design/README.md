# 詳細設計 README

## Overview
本プロジェクトでは `AsciiDoc` を用いて詳細設計書を作成しています。  
`.adoc` ファイルで AsciiDoc を書き、 `Ruby` の `Asciidoctor` Gem を用いて製本 PDF を出力しています。

## System requirement
* Ruby 2.3.1
* 主な Gem
    * asciidoctor
    * asciidoctor-fopub


## Setup
下記コマンドで必要な Gem をインストールします

* `bundle install --path vendor/bundle -j4 --binstubs=vendor/bin`


## Directory structure

~~~~bash
.
├── PRJ_foo_DetailedDesign.adoc    # 製本 PDF を生成するためのインデックスファイル
├── PRJ_foo_DetailedDesign_vi.adoc
├── PRJ_qux_DetailedDesign.adoc
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── out/                           # 製本 PDF ファイル出力先ディレクトリ
│   ├── PRJ_foo_DetailedDesign.pdf # 生成された製本 PDF ファイル
│   ├── PRJ_foo_DetailedDesign_vi.pdf
│   └── PRJ_qux_DetailedDesign.pdf
└── src/                           # 元ファイル格納ディレクトリ
    ├── foo/                       # 製本 PDF の単位でディレクトリを設ける
    │   ├── assets/                # 挿絵などで利用するアセット用ディレクトリ
    │   ├── ja/                    # 日本語用ディレクトリ
    │   │  ├── bar.adoc            # 元ファイル
    │   │  └── _include/           # インクルードディレクトリ
    │   └── vi/                    # ベトナム語用ディレクトリ
    │       ├── bar.adoc
    │       └── _include/
    └── qux/
        └── ja/
             ├── bar.adoc
             └── _include/
~~~~

## How to generate

### 通常パターン
下記のように引数無しで `rake` を実行すると製本 PDF を生成します。

* `TARGET=./PRG_foo_DetailedDesign.adoc rake`

### 横置きで出力
生成する製本 PDF を横置きで出力する場合は `PAGE_ORIENTATION` 変数で **landscape** を指定します。

* `PAGE_ORIENTATION=landscape TARGET=./PRG_qux_DetailedDesign.adoc rake`


