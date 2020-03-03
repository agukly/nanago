class UsersController < ApplicationController
    def show
       # params[:id] == current_user.id unless params[:id]
       # @user = User.find(params[:id])
       @user = User.find(params[:id])
    end
end
