Rails.application.routes.draw do

  get 'admin/addplayer'

  get 'admin/playerslist'

  get 'admin/gameslist'

  get 'admin/gamesviewer?.:gamecode' =>'admin#gamesviewer'
  get 'searchgame' => 'admin#gamesviewer'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'admin/masterviewer'
  get 'admin/assessments'
  get 'admin/editgamestats'
  get 'statsviewer/show'
  root 'homepage#index'
  get 'admin/addgamestats'
  post 'admin/savegamestats'
  post 'admin/saveplayer'
  get 'admin/addassessments'
  post 'admin/saveassessments'
  get 'admin/playerviewer'
  get '/search' => 'statsviewer#show'
  resources :players
  resources :games
  resources :assessments

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get 'view?secrekey=.:secretkey' => 'statsviewer#show'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
