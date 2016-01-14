Rails.application.routes.draw do
  devise_for :users
  resources :convites
  resources :convidados
  root "convidados#index"
  post "/convites/busca" => "convites#busca"

end
