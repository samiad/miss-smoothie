Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
mount Attachinary::Engine => "/attachinary"
root 'smoothies#index'
resources :smoothies, only: [:show, :new, :create] do
  resources :doses, only: [:new, :create, :destroy], shallow: true
  end
end
