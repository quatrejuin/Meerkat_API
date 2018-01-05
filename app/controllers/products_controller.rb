class ProductsController < ApiController
  before_action :require_login
  before_action :cors_set_access_control_headers
  skip_before_action :require_login, :only => [:route_options]

  def route_options
    cors_preflight_check
  end
  
  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email'
    response.headers['Access-Control-Max-Age'] = "1728000"
  end

  def index
    @products = Product.all()
    render json: @products
  end

  def create
    article = Product.create(
      sku: params[:sku],
      name: params[:name],
      price: params[:price],
      quantity: params[:quantity]
    )
    render json: { article: article }
  end
end
