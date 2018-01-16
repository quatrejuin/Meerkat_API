Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*all', controller: 'products', action: 'cors_preflight_check', via: [:options]
  resources :products

  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end

  post "graphql" => "graphqls#create"

  match '*all', controller: 'graphql', action: 'cors_preflight_check', via: [:options]

  #mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
end
