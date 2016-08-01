class CommentsController < ApplicationController
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
      redirect_to "/wibnis/#{params[:wibni_id]}"
    else
      redirect_to root_path
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :content, :user_id, :wibni_id)
    end

end
