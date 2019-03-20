class ProfilesController < ApplicationController

  before_action :ensure_valid_password, only: :change_password

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
    else
      flash[:error] = "#{current_user.errors.messages.values.flatten.join(',')}"
    end

    respond_with current_user, location: request.referrer
  end

  def change_password
    if current_user.update_attributes(change_password_params)
      flash[:success] = "Password Updated"
      bypass_sign_in(current_user)
    else
      flash[:error] = "#{current_user.errors.messages.values.flatten.join(',')}"
    end

    respond_with current_user, location: edit_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :gender)
  end

  def change_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def ensure_valid_password
    if !current_user.valid_password?(change_password_params[:current_password])
      flash[:error] = 'Current Password is incorrect'
      redirect_to edit_profile_path
    end
  end
end
