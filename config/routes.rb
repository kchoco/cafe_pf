Rails.application.routes.draw do

devise_for :users
root to: 'homes#top'
get 'about' => 'homes#about'

get 'tags/:tag', to: 'post_images#index', as: :tag
resources :post_images
root to: 'post_images#index'


resources :users, only: [:show, :edit, :update] do
      member do
        get :unsubscribe
        patch :withdraw
      end
      resource :relationships, only: [:create, :destroy]
       get 'followings' => 'relationships#followings', as: 'followings'
       get 'followers' => 'relationships#followers', as: 'followers'
  end

resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
end

get 'search' => 'post_images#search'

resources :contacts, only: [:new, :create]
post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
post 'contacts/back', to: 'contacts#back', as: 'back'
get 'done', to: 'contacts#done', as: 'done'

end
