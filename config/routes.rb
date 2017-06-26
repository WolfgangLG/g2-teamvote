Rails.application.routes.draw do
  get 'employees/index'

  root 'employees#index'

  resources :employees, only: [] do
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
end
