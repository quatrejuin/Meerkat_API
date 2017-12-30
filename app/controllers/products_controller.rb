class ProductsController < ApiController
  before_action :require_login
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
