class SummariesController < ApplicationController

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    logger.debug("#{@summary.inspect}")
  end

  def new
    @post = Post.find(params[:post_id])
    @post.summary = Summary.new
    @summary = @post.summary
    logger.debug("#{@summary.inspect}")
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    logger.debug("#{@summary.inspect}")
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary(params[:summary].permit(:body))
    if @summary.save
      flash[:notice] = "Summary was saved"
      redirect_to [@post, @summary]
    else
      flash[:error] = "There was an error saving your summary."
      render :new
    end
    logger.debug("#{@summary.inspect}")
  end

  def update
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    if @summary.update_attributes(params.require(:summary).permit(:body))
      flash[:notice] = "Summary was updated"
      redirect_to [@post, @summary]
    else
      flash[:error] = "There was an error saving your summary."
      render :edit
    end
    logger.debug("#{@summary.inspect}")
  end
end
