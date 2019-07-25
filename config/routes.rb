Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: 'callbacks' }
    devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do 
      get 'signup', to: 'devise/registrations#new'
    end
  root 'pages#home'
end
