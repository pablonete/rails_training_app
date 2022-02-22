Rails.application.routes.draw do
  resources :movies do
    resources :rereleases, only: [:create]
  end

  resources :directors
end
