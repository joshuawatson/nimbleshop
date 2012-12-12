Rails.application.routes.draw do
  devise_for :users, { class_name: "User", module: :devise }
end

Rails.application.routes.prepend do
  as :user do
    get "users/edit" => "devise/registrations#edit", as: "edit_user_registration"
    put "users" => "devise/registrations#update", as: "user_registration"
  end

  devise_scope :user do
    get '/login' => 'nimbleshop_auth/user_sessions#new', :as => :login
    get '/signup' => 'nimbleshop_auth/user_registrations#new', :as => :signup
  end

  scope "admin", module: :admin, as: :admin do
    resources :users
  end

end
