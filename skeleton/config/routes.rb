Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # should be singular for semantics
  # denies wildcard routes

  root to: redirect('/cats')  # causes 'localhost:3000' to redirect to 'localhost:3000/cats'
end