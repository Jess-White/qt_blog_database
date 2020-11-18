Rails.application.routes.draw do
  namespace :api do
    get "/blogs" => "blogs#index"
    post "/blogs" => "blogs#create"
    get "/blogs/:id" => "blogs#show"
    patch "/blogs/:id" => "blogs#update"
    delete "/blogs/:id" => "blogs#destroy"
  end
end
