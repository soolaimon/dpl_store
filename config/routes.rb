Rails.application.routes.draw do
  resources :products
  root 'site#index' #
  get '/about' => 'site#about'
end
