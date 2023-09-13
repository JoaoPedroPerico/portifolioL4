Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "site#index"
  get "/secondPage", to: "site#secondPage", as: :second_page
end
