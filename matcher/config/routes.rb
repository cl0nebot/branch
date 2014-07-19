Matcher::Engine.routes.draw do
  resources :answers, only: [:new, :create]
end
