class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.requie(:user).permit(:first_name, :last_name, :email, :phone, :gender, :address, :role, :password, :password_confirmation)
  end

  def account_update_params
    params.requie(:user).permit(:first_name, :last_name, :email, :phone, :gender, :address, :role, :password, :password_confirmation, :current_password)
  end
end