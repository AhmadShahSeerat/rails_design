Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#   get '/designs', to: 'designs#index' #all designs 
  
#   get '/designs/new', to: 'designs#new' #creating designs form
#   post '/designs', to: 'designs#create' #creating designs posting designs

#   get '/designs/:id/edit', to: 'designs#edit' #edit form
#   patch '/designs/:id', to: 'designs#update' #edit
#   put '/designs/:id', to: 'designs#update' #same as patch put and patch are same thing but does abit different job

# delete '/designs/:id', to: 'designs#destroy' #destroy or deletes a designs 

#   get 'designs/:id', to: 'designs#show', as: 'design' #one design show

resources :designs #this one macro does all the job for the above lines for us

  #CUSTOM ROUTES ARE LIKE BELOW
  get '/most_recent', to: 'designs#most_recent', as: 'recent' #most recent designs

end
