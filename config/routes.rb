Rails.application.routes.draw do
  resources :movies do
    resources :rereleases, only: [:create, :new]
  end

  resources :directors
end
