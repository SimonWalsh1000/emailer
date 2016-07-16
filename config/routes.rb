Rails.application.routes.draw do

  resources :checks do
    collection do
      get :erase
      get :upload
      get :download
      get :excel
      post :import
      get :nuclear
    end
  end

  resources :lists do
    collection do
      get :erase
      get :upload
      get :download
      get :excel
      post :import

    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'home/index'


end
