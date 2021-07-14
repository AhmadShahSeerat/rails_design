Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/designs', to: 'designs#index'

  get 'designs/:id', to: 'designs#show', as: 'design'
  get '/most_recent', to: 'designs#most_recent', as: 'recent'

end
