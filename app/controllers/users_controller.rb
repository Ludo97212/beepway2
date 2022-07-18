class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash.notice = 'Utilisateur créé'
    else
      flash.now.alert = 'Erreur! Essayez à nouveau'
      render :new
    end
  end

  def index
    if current_user.admin == true
      @users = User.all.order(nom: :asc)
    end
  end


  def show
  end

  private

  def user_params
    params.require(:user).permit(:genre, :nom, :prenom, :email, :password,
                                  :date_naissance, :adresse, :code_postal, :ville, :telephone,
                                  :statut, :url_avatar, :date_update)
  end
end
