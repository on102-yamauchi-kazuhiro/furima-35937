Rails.application.routes.draw do
  devise_for :users

  # localhost:3000にアクセスしたときにproductsコントローラーのindexアクションをうごかすための記述を書く。
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :show, :edit, :update]
end
