class ProductsController < ApiController
  before_action :require_login,:cors_preflight_check
  after_action :cors_set_access_control_headers
  skip_before_action :require_login, :only => [:cors_preflight_check]
  
  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end
  
  def cors_preflight_check
    if request.method == 'OPTIONS'
      cors_set_access_control_headers
      render plain: '',  content_type: 'text/plain'
    end
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
