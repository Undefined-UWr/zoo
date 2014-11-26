Rails.application.routes.draw do
  resources :animals
  root 'static_page#home'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match 'static_page/user', to: "static_page#user", via: [:get]
  match 'static_page/admin', to: "static_page#admin", via: [:get]
end
