Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    collection do
      get "research", to: "cocktails#research"
    end
  end
  resources :doses, only: :destroy
end
