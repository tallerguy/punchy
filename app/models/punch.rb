class Punch < ApplicationRecord

  TYPES = ['ClockIn', 'ClockOut']

  belongs_to :user
end
