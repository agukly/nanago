class UsersController < ApplicationController
    def show_dashboard
        @user = current_user
        authorize @user
    end
    
    def show
        @user = User.find(params[:id])
        authorize @user
    end
end
