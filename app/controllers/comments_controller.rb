class CommentsController < ApplicationController
  def create
  @post = Post.friendly.find(params[:post_id])
  @comment = @post.comments.build(comment_params)

  if @comment.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post, notice: "Comment added." }
    end
  else
    render turbo_stream: turbo_stream.replace(
      "new_comment",
      partial: "comments/form",
      locals: { post: @post, comment: @comment }
    )
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
