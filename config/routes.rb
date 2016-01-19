Rails.application.routes.draw do
  devise_for :users
  get  "/convites/busca" => "convites#busca"
  resources :convites
  resources :convidados
  root "convidados#index"
  
 
end
