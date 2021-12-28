class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.create!(comment_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
