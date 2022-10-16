Rails.application.routes.draw do


   #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/detain' => "customers#detain"
    patch 'customers/out' => "customers#out"
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show, :new]
    resources :cart_items, only: [:index, :create, :delete,]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

