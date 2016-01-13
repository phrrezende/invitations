Rails.application.routes.draw do
  resources :convites
  resources :convidados
  root "convidados#index"
  post "/convites/busca" => "convites#busca"

end
