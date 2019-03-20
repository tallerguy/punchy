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

  attr_accessor :current_password

  state_machine :state, initial: :registered do
    event :clock_in do
      transition to: :clocked_in, from: [:registered, :clocked_out]
    end

    event :clock_out do
      transition to: :clocked_out, from: :clocked_in
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

  # Class Methods

  # Instance Methods

  def name
    [first_name, last_name].join(' ')
  end

end
