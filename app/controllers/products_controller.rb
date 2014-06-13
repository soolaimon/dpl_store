class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
   # The index action
   # This should list all of our products
   # index.html.erb
  def index
    @products = Product.all
  end

  # This should find a particular product
  def show
  end

  def new
              # No using .create because that would save to DB, but we don't have anything to save to DB yet.
    @product = Product.new

  end

  def create

    @product = Product.new(product_params)
    if @product.save # returns boolean
      flash[:notice] = 'Good job! You did it.'
      redirect_to products_path
    else
      # Saving to DB failed
      # Do something else
      flash[:alert] = 'Bad job! You failed.'
      render :new
    end
  end

  def edit
  end

  def update

    if @product.update_attributes(product_params) # returns boolean depending on whether it updated or not
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  # define a private method
  # use strong parameters
  def product_params
    # params[:product]
    params.require(:product).permit(:name)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
