Rails.application.routes.draw do
  devise_for :users
    get 'welcome/hello'
    get 'welcome/about'

    resources :goals
    patch '/goals/:id/complete', to: 'goals#complete', as: :goal_complete

    root 'welcome#hello'
end
