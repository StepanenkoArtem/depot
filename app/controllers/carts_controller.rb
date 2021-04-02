class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]

  def show
    @cart = Cart.find(session[:cart_id])
    respond_to do |format|
      format.html { render :show }
    end
  end

  def erase
    @cart = Cart.find(session[:cart_id])
    @cart.erase
    render :show
  end

  # def update
  #  respond_to do |format|
  #    if @cart.update(cart_params)
  #      format.html { redirect_to @cart, notice: "Cart was successfully updated." }
  #      format.json { render :show, status: :ok, location: @cart }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @cart.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:id)
  end
end
