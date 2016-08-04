class CategoriesController < ApplicationController
  before_action :admin_user, except: [:index, :show]


  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category created"
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def show
    params[:order_id]? @order_by = params[:order_id] : @order_by = "created_at"
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to categories_url
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

  def category_params
      params.require(:category).permit(:name, :picture)
  end

  def admin_user
      current_user ? (redirect_to(root_url) unless current_user.admin?): redirect_to(root_url)
  end

end
