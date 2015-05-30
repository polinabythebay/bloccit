class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def show
    # @post = Post.find(@summary.post_id)
    @summary = Summary.find(params[:id])
    logger.debug("#{@summary.inspect}")
  end

  def new
    # @post = Post.find(params[:post_id])
    @summary = Summary.new
    logger.debug("#{@summary.inspect}")
  end

  def edit
    # @post = Post.find(@summary.post_id)
    @summary = Summary.find(params[:id])
    logger.debug("#{@summary.inspect}")
  end

  def create
    # @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    # @summary.post = @post

    if @summary.save
      flash[:notice] = "Summary was saved"
      # redirect_to @post
      redirect_to :summary
    else
      flash[:error] = "There was an error saving your summary."
      render :new
    end
    logger.debug("#{@summary.inspect}")
  end

  def update
    # @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])

    if @summary.update_attributes(params.require(:summary).permit(:body))
      flash[:notice] = "Summary was updated"
      # redirect_to @post
      redirect_to :summary
    else
      flash[:error] = "There was an error saving your summary."
      render :edit
    end
    logger.debug("#{@summary.inspect}")
  end

end
