class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  def update
  
    @cart.quantity = params[:cart][:quantity]
    @cart.subtotal = @cart.quantity * @cart.products_price
  
    if @cart.save
      redirect_to carts_path, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end
  
  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
 # def create
    # @cart = Cart.new(cart_params)

   #respond_to do |format|
      #if @cart.save
       #format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        #format.json { render :show, status: :created, location: @cart }
      #else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @cart.errors, status: :unprocessable_entity }
      #end
    #end
 # end

  # PATCH/PUT /carts/1 or /carts/1.json
  #def update
    #respond_to do |format|
      #if @cart.update(cart_params)
        #format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        #format.json { render :show, status: :ok, location: @cart }
      #else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @cart.errors, status: :unprocessable_entity }
      #end
    #end
 # end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user = current_user
    if @cart.save
      Sale.create_from_cart_items(current_user, current_user.carts)
      Cart.destroy_all
      redirect_to root_path
    else
      render :new
    end
  end
  

  def current_order
    #@carts = Cart.where(user_id: current_user.id).group(:order_session).select('*, MAX(id) as id')
  end

  def submit_button
    Cart.select(:curent_order_sission.max, user_id: current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_product, :quantity, :subtotal)
    end
end
