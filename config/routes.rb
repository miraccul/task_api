Rails.application.routes.draw do
  get "/projects", to: "projects#index"
  post "/todos", to: "todos#create"
  resources :projects do
    resources :todos
  end
end
