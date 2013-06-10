InvisibleFriend::Application.routes.draw do

  devise_for :users

  resources :player_lists do
    resources :players
  end

  root :to => 'player_lists#index'

end
