Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "users#index", as: :root
  get "users/mypage" => "users#mypage"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"
  resources :users, except: [:index, :new]
  
  
  get "about" => "operation#top"
  get "about/service" => "operation#service"
  get "about/company" => "operation#company"
  get "about/system" => "operation#system"
  get "about/contact" => "operation#contact"
  
end
