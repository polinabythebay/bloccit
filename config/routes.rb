Rails.application.routes.draw do
  
  resources :summaries

  devise_for :users
  resources :users, only: [:update]

  resources :topics do 
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'

end
