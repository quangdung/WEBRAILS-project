class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:nom, :prenom, :telephone, :email, :type, :password, :password_confirmation)

    # MAJ la table roles_users
    # @user = User.find(params[:user.id])


    # @user = User.last
    #
    # for id_role in params[:user][:role_ids]
    #   le_role = Role.find(id_role)
    #   @user.roles << le_role
    # end


    # redirect_to animals_path
  end

  def account_update_params
    params.require(:user).permit(:nom, :prenom, :telephone, :email, :type, :password, :password_confirmation, :current_password)
  end
end