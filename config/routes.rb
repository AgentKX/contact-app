Rails.application.routes.draw do
  get '/contacts' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  get '/contacts/:id' => 'contacts#show'
  get '/contacts/:id/edit' => 'contacts#edit'
  patch '/contacts/:id' => 'contacts#update'
  delete '/contacts/:id' => 'contacts#delete'








  get '/form' => 'contacts#form'
  post '/form_result' => 'contacts#submitted'


 



  get '/num_form' => 'contacts#enter_num'
  post '/num_result' => 'contacts#num_result'
  
end