Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  root 'store#index', as: 'store_index' # this last part creates accessor methods so the tests continue to work
  resources :carts
  resources :line_items
  resources :orders
  resources :products do
    # curl --silent http://localhost:3000/products/2/who_bought.atom
    # TODO: member?
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
