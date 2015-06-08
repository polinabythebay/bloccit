class CommentsController < ApplicationController

  def comment
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.build(params[:comment].permit(:body))
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your comment. Please try again"
      redirect_to [@topic, @post]
    end
  end
end
