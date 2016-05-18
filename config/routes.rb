Rails.application.routes.draw do
  devise_for :users
  get  "/convites/busca" => "convites#busca"
  get  "/convidados/busca" => "convidados#busca"
  get  "/convidados/busca_com_filtro" => "convidados#busca_com_filtro"
  get  "/convidados/todos_convidados" => "convidados#todos_convidados"
  get  "/convidados/importar" => "convidados#importar_csv"
  post  "/convidados/filtrar" => "convidados#filtrar"
  resources :convites
  resources :convidados
  root "convidados#index"
  
 
end
