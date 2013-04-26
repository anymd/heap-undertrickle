HeapUndertrickle::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "home#index"
  resources :users
  resources :sessions

  resources :questions do
    resources :responses
    resources :answers
    post "upvote" => "questions#upvote", :as => "upvote"
    post "downvote" => "questions#downvote", :as => "downvote"
  end

  resources :answers do
    resources :responses
    post "upvote" => "answers#upvote", :as => "upvote"
    post "downvote" => "answers#downvote", :as => "downvote"
  end

end
