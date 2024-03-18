class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]
  # before_action :set_categories, only: [:new, :create, :edit, :update]

  def index
    @products = Product.includes(:category).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product was successfully created.'
    else
      logger.info @product.errors.full_messages.to_sentence
      flash[:alert] = @product.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      logger.info @product.errors.full_messages.to_sentence
      flash[:alert] = @product.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # def set_categories
  #   @categories = Category.all
  # end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :category_id)
  end
end
