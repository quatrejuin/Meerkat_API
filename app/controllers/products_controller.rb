class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Product.all()
    render json: Product
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
