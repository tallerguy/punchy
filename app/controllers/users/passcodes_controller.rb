class Users::PasscodesController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    if current_user.generate_passcode
      flash[:success] = "Passcode is: #{current_user.passcode}"
    else
      flash[:error] = "Passcode generation failed. Please try again"
    end

    redirect_to edit_profile_path
  end

  def unlock

    user = User.find_by(passcode: user_params[:passcode])

    if user && sign_in(user)
      flash[:success] = "Welcome #{current_user.name}"

      redirect_to authenticated_root_path
    else
      flash[:error] = 'Incorrect Pin. Try again'

      redirect_to new_users_passcode_path
    end
  end

  def lock
    if sign_out(current_user)
      flash[:success] = 'Locked!'

      redirect_to new_users_passcode_path
    else
      flash[:error] = 'Something went wrong'

      redirect_to authenticate_root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:passcode)
  end
end
