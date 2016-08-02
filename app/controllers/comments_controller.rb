class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :delete]

  def index
    @comments = Comment.paginate(page: params[:page])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.wibni_id = params[:id]
    if @comment.save
      flash[:success] = "New comment created"
      redirect_to "/wibnis/#{params[:id]}"
    else
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  def delete
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to "/wibnis/#{params[:wibni_id]}"
  end


  private

    def comment_params
      params.require(:comment).permit(:title, :content, :user_id, :wibni_id)
    end

    def correct_user
      @comment_user = Comment.find(params[:comment_id]).user
      current_user?(@comment_user)
    end

end
