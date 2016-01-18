Rails.application.routes.draw do
  devise_for :users
  get  "/convidados/busca" => "convidados#busca"
  resources :convites
  resources :convidados
  root "convidados#index"
  post "/convites/busca" => "convites#busca"
 
end
