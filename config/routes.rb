Rails.application.routes.draw do
  # トップページを home#index に設定
  root "home#index"

  # postsリソースを設定(index, new, create, destroyアクションを追加)
  resources :posts, only: [ :index, :new, :create, :destroy ]

  # その他のカスタムルート（必要に応じて）
  get "up" => "rails/health#show", as: :rails_health_check
end
