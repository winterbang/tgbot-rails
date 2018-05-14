Tgbot::Engine.routes.draw do
  # root to: 'tgbot#index'
  post '/tgbot/:token',  to: 'tgbot#index'
end
