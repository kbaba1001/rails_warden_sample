require Rails.root.join('lib/auth/constraint')

Rails.application.routes.draw do
  scope module: 'users' do
    root 'welcomes#show', constraints: Auth::Constrait::SignedOut.new
    root 'dashboards#show', as: :signed_in_root, constraints: Auth::Constrait::SignedIn.new

    resources :sessions, only: %i(new create destroy)
  end

  namespace :admins do
    root 'sessions#new', constraints: Auth::Constrait::SignedOut.new(:admin)
    root 'dashboards#show', as: :signed_in_root, constraints: Auth::Constrait::SignedIn.new(:admin)

    resources :sessions, only: %i(new create destroy)
  end
end
