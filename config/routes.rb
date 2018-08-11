Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :photos
    root "photos#index"

    resources :"users", only:[:index, :show, :index]

    namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :photos, only: [:index, :create, :show, :update, :destroy]
      end
    end

end
