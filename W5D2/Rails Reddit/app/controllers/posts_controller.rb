class PostsController < ApplicationController
  before_action :require_logged_in, except: [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.author_id = current_user.id

    if @post.save
      
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(posts_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to post_url(@post)
  end

  private
  def posts_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
