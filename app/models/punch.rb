class Punch < ApplicationRecord
  self.per_page = 10

  TYPES = {
    clock_in: 'Clock In',
    clock_out: 'Clock out'
  }

  belongs_to :user

  before_create :add_punch_type
  after_create :add_punched_at
  after_create :update_user_state
  # after_destroy :caliberate_user_state

  # validate :no_future_punch

  def title
    punched_at.strftime(DATE_FORMAT)
  end

  # private

  def add_punched_at
    touch :punched_at
  end
  # # Punch Type determines if it is a clock in or clock out
  # # This is added when the punch record is crated based on the
  # # user state. If the user is clocked out then we set the punch
  # # type to clock_in and vice versa.
  def add_punch_type
    self.punch_type = user.clocked_in? ? TYPES[:clock_out] : TYPES[:clock_in]
  end

  # After a punch record is created we need to update the user state
  # if the punch type is clock_in the we move the user to clocked_in
  # and vice versa
  def update_user_state
    user.clocked_in? ? user.clock_out : user.clock_in
  end

  # # Make sure that the punch being updated doesnt create
  # # an invalid punch record
  # def no_future_punch
  #   errors.add(:punched_at, 'cannot be in the future') if self.punched_at > DateTime.now
  # end

  # # If a punch record is removed we need to make sure that the
  # # user record is in the right state. For ex: if we remove the last punch
  # # and that punch record was a clock_out then user will be in clock_out state.
  # # We need to make sure that when the user now comes back to the dashboard
  # # the currect button shows up, for this we need to take the last punch and
  # # caliberate the user state according to that.
  # def caliberate_user_state
  #   return user.clock_out if !user.punches.present?

  #   last_punch = user.punches.last

  #   last_punch.punch_type == TYPES[:clock_in] ? user.clock_in : user.clock_out
  # end
end
