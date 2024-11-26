Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top'
  get '/login' => 'login#top'
  get '/administrator' => 'home#administrator'
  get '/OK' => 'home#OK'

  get 'view/top' => 'view#top'
  get 'view/:id' => 'view#index'

  post 'post/:id/submit' => 'post#submit'
  get 'post/thankyou' => 'post#thankyou'
  post "/post/addband" => 'post#addband'
  post "/post/addbandid" => "post#addbandid"
  post "/post/deleteband" => 'post#deleteband'
  post '/post/deletepost' => 'post#deletepost'
  get 'post/:id' => 'post#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
