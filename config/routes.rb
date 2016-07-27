Rails.application.routes.draw do
  root to: 'pages#root'
  get '/auth/:provider/callback' => 'contacts#index'
  get '/contacts/:provider/callback' => 'contacts#new'
end
