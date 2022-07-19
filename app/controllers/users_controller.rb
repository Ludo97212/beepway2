class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) if @user == current_user || @user.admin == true
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user || @user.admin == true
      if @user.update(user_params)
        redirect_to @user
        flash.notice = 'Modifications enregistrées'
      else
        flash.now.alert = 'Erreur! Essayez à nouveau'
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def check_if_admin
  #   redirect_to root_path unless current_user.admin == true
  # end
end
