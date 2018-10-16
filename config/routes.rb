Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => "user/sessions"
  }
  resource :appointment, only: [:new, :create, :show, :edit, :update]
  resource :answer, only: [:create, :update]
  
  get '/settings' => 'settings#index'
  put '/settings' => 'settings#update'
  post '/settings' => 'settings#update'
  patch '/settings' => 'settings#update'

  get '/' => "welcome#index", as: :root
end
