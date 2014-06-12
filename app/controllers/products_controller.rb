class ProductsController < ApplicationController
   # The index action
   # This should list all of our products
   # index.html.erb
  def index
    @products = Product.all
  end

  # This should find a particular product
  def show
    @product = Product.find(params[:id])
  end

  def new
              # No using .create because that would save to DB, but we don't have anything to save to DB yet.
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save # returns boolean
      redirect_to products_path
    else
      # Saving to DB failed
      # Do something else
      render :new
    end
  end

  private
  # define a private method
  # use strong parameters

  def product_params
    # params[:product]
    params.require(:product).permit(:name)
  end

end
