class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders/1 or /orders/1.json
  def show; end

  # GET /order/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      session[:order_id] = @order.id
      redirect_to thank_you_path, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #      format.html { redirect_to @order, notice: "Order was successfully updated." }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1 or /orders/1.json
  # def destroy
  #  @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(session[:order_id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:name, :address, :phone, :email, :payment_method)
  end

  def ensure_cart_isnt_empty
    redirect_to store_index_url, notice: 'Your cart is empty' if @cart.line_items.empty?
  end
end
