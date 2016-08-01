class WibnisController < ApplicationController
  before_action :correct_user_for_new, only: [:new]

  def index
    @categories = Category.all
    @wibnis = Wibni.paginate(page: params[:page])
  end

  def new
    @wibni = Wibni.new
  end

  def create
    @wibni = current_user.wibnis.build(wibni_params)
    if @wibni.save
      flash[:success] = "New WIBNI created"
      redirect_to wibnis_url
    else
      render 'new'
    end
  end

  def show
    @wibni = Wibni.find(params[:id])
  end

  def edit
    @wibni = Wibni.find(params[:id])
  end

  def update
    @wibni = Wibni.find(params[:id])
    if @wibni.update_attributes(wibni_params)
      flash[:success] = "WIBNI updated"
      redirect_to wibnis_url
    else
      render 'edit'
    end
  end

  def destroy
    Wibni.find(params[:id]).destroy
    flash[:success] = "Wibni deleted"
    redirect_to user
  end

  private

  def wibni_params
      params.require(:wibni).permit(:title, :summary, :description, :looking_for, :category_id, :picture, :user_id)
  end

  def admin_user
      current_user ? (redirect_to(root_url) unless current_user.admin?): redirect_to(root_url)
  end

  def correct_user_for_new
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless current_user?(@user)
  end

end
