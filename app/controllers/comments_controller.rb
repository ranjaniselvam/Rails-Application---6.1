class CommentsController < ApplicationController
  before_action :set_topic,:set_post

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to topic_post_path(@topic, @post), notice: "Commented on this post !" }
      end
    else
      redirect_to topic_post_path(@topic, @post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      redirect_to topic_post_path(@topic, @post), notice: "Comment deleted !"
    else
      redirect_to topic_post_path(@topic, @post), notice: "Comment not deleted !"
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
