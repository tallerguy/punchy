class PunchesController < ApplicationController

#   before_action :set_punch, except: [:index, :create]

  def index
    @punches = current_user.punches.all.page(params[:page])
  end

#   # We store a punch based on the users current state
#   # The punched at time is equal to the DateTime now.
#   # This can then be edited by the user if needed
  def create
    @punch = current_user.punches.build(punched_at: DateTime.now)

    if @punch.save
      flash[:success] = "Punch Recorded!"
    else
      flash[:error] = "Punch Not Recorded. #{@punch.errors.full_messages.join(', ')}"
    end

    redirect_to authenticated_root_path
  end

#   def edit
#   end

#   def update
#     if @punch.update_attributes(punch_params)
#       flash[:success] = "Punch updated!"
#     else
#       flash[:error] = "Punch Update Failed. #{@punch.errors.full_messages.join(', ')}"
#     end

#     redirect_to punches_path
#   end

#   def destroy
#     if @punch.destroy
#       flash[:success] = "Punch removed successfully"
#     else
#       flash[:error] = "Punch removal Falied: #{@punch.errors.full_messages.join(', ')}"
#     end

#     redirect_to punches_path
#   end

#   private

#   def set_punch
#     @punch = current_user.punches.find(params[:id])
#   end

#   def punch_params
#     params.require(:punch).permit(:id, :punched_at)
#   end
end