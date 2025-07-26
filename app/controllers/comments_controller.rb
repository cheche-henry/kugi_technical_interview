class CommentsController < ApplicationController
  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = params[:comment][:user_id] # Manual user ID for now

    if @comment.save
      redirect_to @post, notice: "Comment added!"
    else
      redirect_to @post, alert: "Comment couldn't be saved."
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
