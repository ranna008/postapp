class SessionsController < ApplicationController
    def New
    end

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:notice] = "login was successfull"
            redirect_to @user
        else
            flash.now[:alert] = "your login details are not correct"
            render 'new'
        end
         
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "you are logged out"
        redirect_to root_path

    end
end