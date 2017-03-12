Rails.application.routes.draw do

  root "companies#index"
  resources :companies do
    resources :contacts do
      resources :relationships, only: [:index, :new, :create, :destroy]
    end
  end
end
