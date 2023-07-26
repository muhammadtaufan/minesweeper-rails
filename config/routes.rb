Rails.application.routes.draw do
  root 'boards#new'
  resources :boards, only: %i[new create show index]
end
