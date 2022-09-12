class PostsController < ApplicationController
 before_action :set_article, only: [:show,:edit,:update,:destroy]
 before_action :require_user, except: [:show, :index]
 before_action :require_same,only:  [:edit,:update,:destroy]
   def index
    @posts=Post.all
 end

 def show
   #  byebug
   
    
 end

 def new
    @post = Post.new
 end

 def create
    # byebug
    # render plain: params[:post]

    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
        flash[:notice] = "article was created"
        redirect_to post_path(@post.id)
    else
        render 'new'
    end
 end

 def edit
   
 end

 def update
   
    if @post.update(post_params)
        flash[:notice] = "article was editted"
        redirect_to post_path(@post.id)
    else
        render 'edit'
    end
 end
 def destroy
   
   @post.destroy
   redirect_to posts_path
 end

private
 def set_article
   @post = Post.find(params[:id])
 end
def post_params
   params.require(:post).permit(:title,:description)
end

 def require_same
   if current_user != @post.user
      flash[:alert] = "you dont have permission"
      redirect_to login_path
   end
 end
end