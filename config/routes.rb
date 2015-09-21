Rails.application.routes.draw do
    root 'welcome#index'
    resources :devices

    resources :friendships, :path => 'friends' do
        member do
            post 'event', :action => 'create_from_event'
        end
    end

    resources :groups do
        resources :groupings, :path => 'members'
    end

    resources :events do
        resources :invites
    end

    devise_for :users
end
