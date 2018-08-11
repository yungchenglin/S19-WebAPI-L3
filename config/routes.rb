Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :photos
    root "photos#index"

    resources :"users", only:[:index, :show, :index]

end
