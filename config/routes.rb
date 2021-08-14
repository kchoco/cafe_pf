Rails.application.routes.draw do
  get 'post_comments/create'
  get 'post_comments/destroy'
  devise_for :users
root to: 'homes#top'

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

end
