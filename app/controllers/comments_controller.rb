class CommentsController < ApplicationController
  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

  if @comment.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post, notice: "Comment was successfully posted." }
    end
  else
    redirect_to @post, alert: "Comment could not be posted."
  end
  end

  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to @post, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
