class StoreController < ApplicationController
  def index
    @products = Product.order(updated_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
