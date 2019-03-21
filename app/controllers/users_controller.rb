class UsersController < ApplicationController

  def update_passcode
    @user = current_user

    if @user.generate_passcode
      flash[:success] = "Passcode is: #{@user.passcode}"
    else
      flash[:error] = "Passcode generation failed. Please try again"
    end

    redirect_to profile_user_path(current_user)
  end

end
