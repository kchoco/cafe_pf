Rails.application.routes.draw do
  devise_for :users
root to: 'homes#top'

resources :users, only: [:show, :edit, :update] do
      member do
        get :unsubscribe
        patch :withdraw
      end
  end

resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]

end

end
