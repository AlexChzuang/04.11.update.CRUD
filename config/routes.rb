Rails.application.routes.draw do
  resources :movies do
    member do
      post :vote
    end
  end
end
