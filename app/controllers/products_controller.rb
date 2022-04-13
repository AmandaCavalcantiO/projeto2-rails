class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @categories = Category.all
    if filter_params.present?
      @products = Product.where(filter_params).order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 3)
    end
  end

  def show
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def filter_params
      params.require(:filtro).permit(:category_id) if params[:filtro].present?
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params[:product][:user_id] = current_user.id
      params.require(:product).permit(:title, :description, :price, :category_id, :user_id, :quantity, :image)
    end
end
