class UsersController < ApplicationController
    before_action :set_user, only: [:show,:edit,:update,:destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same,only:  [:edit,:update,:destroy]
   def index
    @users=User.all
   end
    
    def show
    # byebug
    @posts = @user.posts
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    
    if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "welcome to app"
        redirect_to @user
    else
        render 'new'
    end
    end

    def edit
   
    end
   
    def update
      
       if @user.update(user_params)
           flash[:notice] = "your details were editted"
           redirect_to user_path(@user.id)
       else
           render 'edit'
       end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "your account has been successfully removed"
        redirect_to posts_path
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

     def user_params
        params.require(:user).permit(:username,:password,:email)
     end

     def require_same
        if current_user != @user
            flash[:alert] = "you dont have permission"
            redirect_to login_path
        end
     end
end