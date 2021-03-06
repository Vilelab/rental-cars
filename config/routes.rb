Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #aqui é onde escrevo minhas requisições http. Exemplos: post '/banana', delete '/cadeira', etc
  root 'home#index' #> RAIZ, OU SEJA, ROOT :)
  #get '/', to: home#index


  resources :manufacturers #o only filtras as ações disponíveis (serão sete ao todo)

  #digite rails routes para ver as rotas criadas e suas respectivas actions (ações)

  resources :customers, only: [:index, :show, :new, :create] do
    get 'search', on: :collection
  end
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_categories, only: [:index, :show, :new, :create]
  resources :car_models, only: [:index, :show, :new, :create]
  resources :rentals, only: [:index, :new, :create] do
    get 'search', on: :collection 
  end
end
