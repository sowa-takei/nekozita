Rails.application.routes.draw do
  get 'public/PostComments'
 devise_for :admins,controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'

  get 'admin' => "admin/homes#top", as: "admin"

  namespace :admin do
   resources :items, only: [:new, :index, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
   resources :customers, only: [:index, :show, :edit, :update]
  end

 scope module: :public do
  get 'homes/men' => "homes#men"
  post 'orders/verification' => "orders#verification"
  #get 'orders/verification' => "orders#verification"
  get 'orders/completion' => "orders#completion"
  get 'customers/withdrawal' => "customers#withdrawal"
  put 'customers/proces' => "customers#proces"
  resources :items, only: [:index, :show] do
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  resources :orders, only: [:new, :index, :show, :create]
  resource :customers, only: [:show, :edit, :update]
  resources :address, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    member do
      delete :delete
    end
  end
  devise_for :customers,controllers: {
  sessions: 'customers/sessions',
  passwords: 'customers/passwords',
  registrations: 'customers/registrations'
  }


end
end

