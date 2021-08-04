Rails.application.routes.draw do
  # /collages/:collage_id
  resources :collages do
    resources :designs, only: [:index, :new, :create]
  end
  
  resources :designs 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get '/designs', to: 'designs#index' # index - list all designs
  # get '/designs/new', to: 'designs#new' # new - new form
  # post '/designs', to: 'designs#create' # create - post from the new form
  
  # get '/designs/:id/edit', to: 'designs#edit' #edit - 
  # patch '/designs/:id', to: 'designs#update' #update
  # put '/designs/:id', to: 'designs#update' #update

  # delete '/designs/:id', to: 'designs#destroy' #destroy
 
  # get '/designs/:id', to: 'designs#show', as: 'design' # show
  #custom route                     
  get '/most_recent', to: 'designs#most_recent', as: 'recent'
  get '/search', to: 'designs#search', as: 'search'
  # as: 'recent' => recent_path
  # recent_path = '/most_recent'



end