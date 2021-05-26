Rails.application.routes.draw do

  # root to: 'products#index'

  get 'about' => 'about#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products,  except: [:edit, :update, :show]
    resources :categories,  except: [:edit, :update, :show]
  end



    # This route sends requests to our naked url to the *cool* action in the *gif* controller.
    root to: 'gif#cool'

    # I've created a gif controller so I have a page I can secure later.
    # This is optional (as is the root to: above).
    get '/cool' => 'gif#cool'
    get '/sweet' => 'gif#sweet'

    # These routes will be for signup. The first renders a form in the browse, the second will
    # receive the form and create a user in our database using the data given to us by the user.
    get '/signup' => 'users#new'
    post '/users' => 'users#create'


end
