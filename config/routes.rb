Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'
  get '/board' => 'boards#index'
  get '/board/new' => 'boards#new'
  get '/board/:id/edit' => 'boards#edit'
  put '/board'    => 'boards#index'
  post '/board'    => 'boards#index'
  post '/board/new'    => 'boards#new'
  post '/board/new' => 'boards#new'

  resources :board, only:[:show, :new, :create, :edit, :update]
end

  
#posts#index の posts は、これから作成する controller の名前で、
#index は、controller に設定する関数名だ。



