class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post, only: %i[show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = if @topic.present?
               @topic.posts.all
             else
               Post.includes(:topic).all
             end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    #new - new is for a new instance of a specific model
    # build - build is for creating a new instance within an AR association
    @post = @topic.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @topic.posts.build(post_params)
    # @post.topic_id = params[:topic_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_post_path(@topic,@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_post_path(@topic,@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_url(@topic  ), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id]) if params[:topic_id].present?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @topic.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:about)
    end
end
