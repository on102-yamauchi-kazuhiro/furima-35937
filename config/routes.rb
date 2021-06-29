Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # localhost:3000にアクセスしたときにitemsコントローラーのindexアクションをうごかすための記述を書く。
  # devise_for :users
  root to: 'items#index'
end
