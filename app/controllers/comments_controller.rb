class CommentsController < ApplicationController


    def new
        @comment = Comment.new
     end
    
     def create
         
         @comment = current_user.comments.new(cmt_params)
         
        
    if logged_in && @comment.save
        flash[:notice] = "comment was added"
            redirect_to post_path(params[:post_id])
        else
            flash.now[:alert] = "error happend"
        end
        
     end

     def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

     private
     def cmt_params
        params.require(:comment).permit(:content).merge(post_id: params[:post_id])
     end
end
