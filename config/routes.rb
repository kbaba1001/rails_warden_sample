Rails.application.routes.draw do
  scope module: 'users' do
    # TODO no login root
    resource :welcome, only: :show

    # TODO login root
    resource :dashboard, only: :show

    resources :sessions, only: %i(new create destroy)
  end
end
