class PunchesController < ApplicationController

  def index
    @punches = current_user.punches.page(params[:page])
  end

  def create
    @punch = current_user.punches.build(punched_at: DateTime.now)

    if @punch.save
      flash[:success] = "Punch Recorded!"
    else
      flash[:error] = "Punch Not Recorded. #{@punch.errors.full_messages.join(', ')}"
    end

    redirect_to authenticated_root_path
  end

  def edit
  end

  def udpate
  end

  def destroy
  end

  private

  def punches_params
  end
end