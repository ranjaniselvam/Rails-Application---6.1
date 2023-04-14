class RatingsController < ApplicationController
  before_action :set_topic, :set_post

  def index
    @ratings = @post.ratings.all
  end

  def new
    @rating = @post.ratings.build
  end

  def create
    @rating = @post.ratings.build(rating_params)
    if @rating.save
      respond_to do |format|
        format.html { redirect_to topic_post_path(@topic, @post), notice: "Rating added to post !" }
        format.js {}
      end
    else
      render :new
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:post_id])
  end

  def set_rating
    @rating = @post.ratings.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:topic_id, :post_id, :star)

  end
end

