Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :update] do
    resources :reviews, only: :create
    resources :doses, only: [:new, :create]
    collection do
      get "research", to: "cocktails#research"
    end
  end
  resources :doses, only: :destroy
  mount Attachinary::Engine => "/attachinary"
end
