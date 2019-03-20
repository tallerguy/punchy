class Punch < ApplicationRecord

  self.per_page = 10

  TYPES = {
    clock_in: 'Clock In',
    clock_out: 'Clock out'
  }

  belongs_to :user

  before_create :add_punch_type
  after_create :update_user_state

  def title
    punched_at.strftime(DATE_FORMAT)
  end

  private

  def add_punch_type
    self.punch_type = user.clocked_in? ? TYPES[:clock_out] : TYPES[:clock_in]
  end

  def update_user_state
    user.clocked_in? ? user.clock_out : user.clock_in
  end
end
