GaProgrammingFundamentals::Application.routes.draw do
  root to: "users#new"

  get "/users/new" => "users#new", :as => "new_user"
  post "/users" => "users#create", :as => "create_user"
  get "/users" => "users#index", :as => "users"

  delete "/users/:id" => "users#destroy", :as => "delete_user"

  # resources :users
  # this creates the below routes
  #      root        /                         users#new
  #     users GET    /users(.:format)          users#index
  #           POST   /users(.:format)          users#create
  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit
  #      user GET    /users/:id(.:format)      users#show
  #           PUT    /users/:id(.:format)      users#update
  #           DELETE /users/:id(.:format)      users#destroy
end