Rails.application.routes.draw do
  get 'show' => 'show#index'

  namespace :api do
    namespace :v1 do
      resources :gps
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
