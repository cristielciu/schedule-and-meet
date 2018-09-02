Rails.application.routes.draw do
  devise_for :users
  resource :appointment, only: [:new, :create, :show, :edit, :update]
  resource :answer, only: [:create, :update]

  get '/' => "welcome#index", as: :root
end
