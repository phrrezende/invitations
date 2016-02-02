Rails.application.routes.draw do
  devise_for :users
  get  "/convites/busca" => "convites#busca"
  get  "/convidados/busca" => "convidados#busca"
  get  "/convidados/busca_bairro" => "convidados#busca_bairro"
  get  "/convidados/todos_convidados" => "convidados#todos_convidados"
  resources :convites
  resources :convidados
  root "convidados#index"
  
 
end
