class CommentsController < ApplicationController

  def comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      # redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your comment. Please try again"
      # redirect_to [@topic, @post]
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @post = 
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      #redirect_to [@topic, @post]
    else
      flash[:error] = "Comment was not deleted. Please try again."
      #redirect_to [@topic, @post]
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
