class ProductsController < ApplicationController
  before_action :admin_user, except: [:index, :show]

  def index
    @categories = Category.all
    @products = Product.paginate(page: params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "New product created"
      redirect_to products_url
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(user_params)
      flash[:success] = "product updated"
      redirect_to products_url
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "product deleted"
    redirect_to products_url
  end

  private

  def product_params
      params.require(:product).permit(:name, :price, :category_id, :picture)
  end

  def admin_user
      current_user ? (redirect_to(root_url) unless current_user.admin?): redirect_to(root_url)
  end
end
