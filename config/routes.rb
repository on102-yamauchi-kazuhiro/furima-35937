Rails.application.routes.draw do
  devise_for :users

  # localhost:3000にアクセスしたときにitemsコントローラーのindexアクションをうごかすための記述を書く。
  root to: 'items#index'
end
