Rails.application.routes.draw do
  get 'exhibition/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  get 'mypages/index'
  root "exhibition#index"
  get 'products/index'
  root 'mains#index'
  get 'buy/index'
end
