class StateChange < ApplicationRecord
  belongs_to :stateful, polymorphic: true
  belongs_to :user
end
