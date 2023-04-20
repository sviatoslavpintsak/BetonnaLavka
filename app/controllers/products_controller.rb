class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy buy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buy
    @product = Product.find(params[:id])
    #Rails.logger.info("PARAMS: #{params.inspect}")
    @quantity = params[:quantity].to_i || 1
    @subtotal = @quantity * @product.price 
    @cart = Cart.new(product_id:  params[:id], quantity: params[:quantity], products_price: @product.price, products_product: @product.product, user_id: current_user.id, subtotal: @subtotal )
  
    if @cart.save
      flash[:success] = 'Product added to cart'
    else
      flash[:error] = 'Could not add product to cart'
    end
    redirect_to @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:categorie, :product, :price, :weight, :pics)
    end
end
