Rails.application.routes.draw do
  root 'welcome#index'
  resources :devices

  resources :friendships

  resources :groupings

  resources :groups

  resources :invites

  resources :events

  devise_for :users
end
