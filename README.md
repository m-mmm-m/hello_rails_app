## 📚 Railsチュートリアル課題

Railsを学ぶためのチュートリアル課題を進めています。  
このリポジトリでは、基本的な環境構築から簡単な投稿機能の実装までを行いました。

---

### ✏️ 課題1：Hello Rails

#### 概要
- Railsアプリの初期構築
- コントローラとビューを用いた表示の確認
- ルーティングの設定

#### 実施内容
- `rails new hello_rails_app` でアプリを作成
- `rails generate controller home index` によってコントローラとビューを生成
- `config/routes.rb` にて `root "home#index"` を設定
- `localhost:3000` にアクセスして「Hello Rails」表示を確認

---

### ✏️ 課題2：投稿アプリ

#### 概要
- 投稿モデルを使った簡易的な投稿アプリ
- 投稿の新規作成と一覧表示

#### 実施内容
- `rails generate model Post content:text` でモデル作成
- `rails db:migrate` でテーブル作成
- `rails generate controller posts index new create` でコントローラを作成
- フォームを使って投稿を保存し、一覧で表示

---

### 🛠 使用技術

- Ruby on Rails 7.x
- SQLite3（開発環境）
- GitHub Actions（CI）

---

### 🐛 トラブル対応メモ（環境構築 & CI）

#### ✅ gem 'rails' のインストールが進まない
- `sudo gem install rails` がなかなか終わらない場合がある（ネットワーク環境による）。
- 念のため `brew update` → `brew doctor` でHomebrew環境を確認。
- `brew doctor` の指示に従って不要なtapやdeprecatedなformula（例：openssl@1.1）を整理。

#### ✅ `rails` コマンドが使えない
- `gem install rails` 後に、`rails -v` が効かない場合は、`PATH`が通ってない可能性あり。
- `which rails` や `echo $PATH` で確認。
- `gem env` でインストール場所確認 → `.zprofile` にパスを追記。

#### ✅ `Could not find gem 'propshaft'` のエラー
- `rails generate` 実行時にエラー。
- `bundle install` を実行することで解消。

#### ✅ テスト実行時の `undefined method 'home_index_url'`
- 初期テストファイルが `home_index_url` を参照しているが、`routes.rb` で `root "home#index"` のみ定義していた。
- 対応：テスト内の `get home_index_url` を `get "/"` または `get root_path` に変更。

#### ✅ CIで `bundle install` エラー（platform mismatch）
- GitHub Actions 上で `bundle install` が `"arm64-darwin"` 固定でエラー。
- `bundle lock --add-platform x86_64-linux` をローカルで実行して、CI用のplatformもlockfileに追加。

#### ✅ `bin/importmap` が見つからない
- `bin/setup` を再実行して、`bin/` ディレクトリのスクリプトを全て生成。
- 必要に応じて `rails importmap:install` を実行。

#### ✅ `rubocop` のLintエラー
- `Style/StringLiterals`: シングルクォートではなくダブルクォート推奨。
- `Layout/TrailingEmptyLines`: ファイル末尾に改行がない。