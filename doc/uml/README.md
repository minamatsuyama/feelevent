# UML設計 README

## Overview
本プロジェクトでは Java 製の `PlantUML` を用いて UML 図を作成しています。  
`.pu` ファイルで管理し、 `plantuml` コマンドを用いて PNG 画像を出力しています。

## System requirement
* plantuml コマンド

## Setup
`brew` コマンド等で plantuml をインストール

* `brew install plantuml`


## Directory structure

~~~~bash
.
├── vi/                          # ベトナム語用ディレクトリ
└── ja/                          # 日本語用ディレクトリ
    ├── out/                     # UMLの各図のPNG画像出力ディレクトリ
    │   ├── PRJ_ad_foo.png
    │   ├── PRJ_cd_bar.png
    │   ├── PRJ_sd_baz.png
    │   └── PRJ_ucd_qux.png
    └── src/                     # 元ファイル(各UMLの図単位)
        ├── _assets/             # UML全体で利用するアセットディレクトリ
        ├── _include/            # UML全体で利用するインクルードディレクトリ
        ├── activity/            # アクティビティ図用ディレクトリ
        │   ├── PRJ_ad_foo.pu    # {プロジェクトコード}_ad_{任意}.pu
        │   └── _include/
        ├── class/               # クラス図用ディレクトリ
        │   ├── PRJ_cd_bar.pu    # {プロジェクトコード}_cd_{任意}.pu
        │   └── _include/
        ├── sequence/            # シーケンス図用ディレクトリ
        │   ├── PRJ_sd_baz.pu    # {プロジェクトコード}_sd_{任意}.pu
        │   └── _include/
        └── usecase/             # ユースケース図用ディレクトリ
             ├── PRJ_ucd_qux.pu  # {プロジェクトコード}_ucd_{任意}.pu
             └── _include/
~~~~

## How to generate

* `plantuml PRJ_ad_foo.pu`
