ActionController::Routing::Routes.draw do |map|
  
  map.resources :photos
  map.resources :albums

  map.resources :members, :member => {:make_phi => :put}
  map.resources :sessions
  
  map.login "/login", :controller => "sessions", :action => "new"
  map.logout "/logout", :controller => "sessions", :action => "destroy"

  map.connect 'events/:year/:month/:day', :controller => "events", :action => "index"
  map.resources :events
  
  
  map.resources :wiki_pages
  
  map.root :controller => "main_areas", :action => "index"
  map.connect ":action", :controller => "main_areas"
end
