class ItemsController < ApplicationController
    
  before_action :set_item, only: %i[ show edit update destroy ]
  def index
        @items = Item.all
        #ender body: @items.map{|i| "#{i.categorie}:#{i.product}:#{i.price}"}
    end

    def show
      @item = Item.find(params[:id])
       respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @item }
       end
    end

    def new
        @item = Item.new
    end

    def edit; end


    def create
        @item = Item.new(item_params)
    
        respond_to do |format|
          if @item.save
            format.html { redirect_to item_url(@item), notice: "item was successfully created." }
            format.json { render :show, status: :created, location: @item }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      end


      def update
        respond_to do |format|
          if @item.update(item_params)
            format.html { redirect_to item_url(@item), notice: "item was successfully updated." }
            format.json { render :show, status: :ok, location: @item }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      end
    
 def destroy
    @item.destroy

    respond_to do |format|
    format.html { redirect_to posts_url, notice: "item was successfully destroyed." }
    format.json { head :no_content }
      end
  end

private
# Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

# Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:categorie, :product, :price)
  end

end  