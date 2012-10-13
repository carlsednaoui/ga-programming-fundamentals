GaProgrammingFundamentals::Application.routes.draw do
  root to: "users#new"

  get "/users" => "users#index", :as => "users"
  get "/users/new" => "users#new", :as => "new_user"
  post "/users" => "users#create", :as => "create_user"
  delete "/users/:id(.:format)" => "users#destroy", :as => "delete_user"

  post "/apply" => "users#apply", :as => "apply"
end