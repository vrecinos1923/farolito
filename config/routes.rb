Rails.application.routes.draw do 
  resources :denuncia
  resources :institucioncatalogos
  resources :catalogos
  resources :institucions
  
  root :to => "institucions#index"

  resources :institucions do
    resources :institucioncatalogos
  end

  devise_for :usuarios, 
  	path: 'auth', 
  	path_names: { 
  		sign_in: 'login', 
  		sign_out: 'logout', 
  		password: 'secret', 
  		confirmation: 'verification', 
  		unlock: 'unblock', 
  		registration: 'register', 
  		sign_up: 'let_me_in' }
end
