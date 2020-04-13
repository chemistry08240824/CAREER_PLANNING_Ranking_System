Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "users#index"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  
  get "about" => "operation#top"
  get "about/service" => "operation#top"
  get "about/company" => "operation#company"
  get "about/system" => "operation#system"
  get "about/contact" => "operation#contact"
  
end
