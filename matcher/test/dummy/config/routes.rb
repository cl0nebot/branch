Rails.application.routes.draw do

  mount Matcher::Engine => "/matcher"
end
