class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.valid?
      @post.save
    else
      flash.now[:notice] = "Select and image and type a message"
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to posts_path, notice: "Post was successfully destroyed."
    else
      redirect_to posts_path, notice: "You're not the post owner"
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :imagem)
    end
end
