Nimbleshop::Core::Engine.routes.draw do
  devise_for :users, { class_name: "User", module: :devise }
end

Nimbleshop::Core::Engine.routes.prepend do
  as :user do
    get "users/edit" => "devise/registrations#edit", as: "edit_user_registration"
    put "users" => "devise/registrations#update", as: "user_registration"
  end

  scope "admin", module: :admin, as: :admin do
    resources :users
  end

end
