Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resources :boards
  resources :tasks do
    resources :comments, only: %i[new create]
  end
end

# posts#index の posts は、これから作成する controller の名前で、
# index は、controller に設定する関数名だ。
