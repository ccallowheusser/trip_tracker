Rails.application.routes.draw do
 

  root 'trips#index'

  resources :trips do 
	resources :locations
  end 

  resources :locations do 
  	resources :addresses
  end

  resources :trips do 
	resources :receipts
  end 


# Custom Routes To Add Locations To A Trip
	# get 'new_trip_location/:id', to: 'trips#new_location', as: 'new_trip_location'
	#post 'add_trip_location/:id/:location_id', to: 'trips#add_location', as: 'add_trip_location'
	#delete 'remove_trip_location/:id/:location_id', to: 'trips#remove_location', as: 'remove_trip_location'


end
