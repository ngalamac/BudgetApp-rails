Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'splash#splash'

  resources :categories do
    resources :businesses, only: [:index, :new, :create], as: :businesses
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
