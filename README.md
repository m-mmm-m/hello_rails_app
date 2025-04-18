# 📘 課題1：Hello, Rails! を表示するトップページ
## 🎯 目標
Railsアプリを作って、ブラウザで「Hello, Rails!」と表示されるトップページを作る

## 🛠 手順
### ① Railsアプリを新規作成
```
rails new hello_rails_app
cd hello_rails_app
```

### ② Git初期化してGitHubと連携
```
git init
git remote add origin https://github.com/あなたのユーザー名/hello_rails_app.git
git add .
git commit -m "Initial commit"
git push -u origin main
```

### ③ トップページ用コントローラーを作成
```
rails generate controller home index
```

### ④ トップページ表示のルーティングを設定
config/routes.rb を以下のように修正：
```
root "home#index"
```

### ⑤ ビューに「Hello, Rails!」を書く
app/views/home/index.html.erb を以下のように編集：
```
<h1>Hello, Rails!</h1>
```

### ⑥ サーバー起動＆確認
```
rails server
```
ブラウザで http://localhost:3000 にアクセスして、「Hello, Rails!」が出たらOK！

### ⑦ GitHubにコミット＆Push
```
git add .
git commit -m "Add home controller and root route"
git push
```