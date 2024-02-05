Rails.application.routes.draw do
  resources :dog_breeds, only: %i[index show], param: :breed
  root 'dog_breeds#index'
end
