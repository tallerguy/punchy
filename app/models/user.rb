class User < ApplicationRecord

  GENDERS = ['Male', 'Female']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :state_changes
  has_many :punches
  has_many :clock_ins
  has_many :clock_outs

  state_machine :state, initial: :active do
    event :deactivate do
      transition to: :deactivate, from: :active
    end

    after_transition do |user, transition|
      user.state = user.state
      user.state_changes.create(
        previous_state: transition.from,
        next_state:     transition.to,
        name:           'user',
        user_id:        user.id
      )

      user.save
    end
  end
end
