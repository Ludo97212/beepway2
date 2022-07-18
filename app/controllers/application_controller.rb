class ApplicationController < ActionController::Base
   before_action :authenticate_user!, except: [:index, :show]

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:genre, :nom, :prenom, :email, :password,
                                                                :date_naissance, :adresse, :code_postal, :ville, :telephone,
                                                                :statut, :url_avatar, :date_update)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:genre, :nom, :prenom, :email, :password, :current_password,
                                                                      :date_naissance, :adresse, :code_postal, :ville, :telephone,
                                                                      :statut, :url_avatar, :date_update)}
  end
end
