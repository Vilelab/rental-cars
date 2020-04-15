Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #aqui é onde escrevo minhas requisições http. Exemplos: post '/banana', delete '/cadeira', etc
  root 'home#index' #> RAIZ, OU SEJA, ROOT :)
  #get '/', to: home#index


  resources :manufacturers, only: [:index, :show, :new, :create] #o only filtras as ações disponíveis

  #digite rails routes para ver as rotas criadas e suas respectivas actions (ações)

  resources :customers, only: [:index, :show, :new, :create]

end
