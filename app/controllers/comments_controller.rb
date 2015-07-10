class CommentsController < ApplicationController

  def comment
  end

  #what's a better way to reference many params in controllers? 
  #I'm using two different ways in create and destroy
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.build(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your comment. Please try again"
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
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
end
