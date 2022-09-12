class FavouritesController < ApplicationController
    before_action :find_post
 before_action :find_favourite, only: [:destroy]
 
 def create
 if already_favour?
 flash[:notice] = "You can't  favourite more than once"
 else
 @post.favourites.create(user_id: current_user.id)
 end 
 redirect_to post_path(@post)
 end
 
 def find_favourite
 @favourite = @post.favourites.find(params[:id])
 end
 
 def destroy
 if !(already_favour?)
 flash[:notice] = "Cannot unfavourite"
 else
 @favourite.destroy
 end
 redirect_to post_path(@post)
 end
 
 private
 
 def find_post
 @post = Post.find(params[:post_id])
 end
 
 def already_favour?
 Favourite.where(user_id: current_user.id, post_id:
 params[:post_id]).exists?
 end
end
