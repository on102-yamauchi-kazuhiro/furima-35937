Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  # localhost:3000にアクセスしたときにproductsコントローラーのindexアクションをうごかすための記述を書く。
  root to: 'products#index'
  resources :products do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
  end
end
