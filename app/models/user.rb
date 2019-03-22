class User < ApplicationRecord

  GENDERS = ['Male', 'Female']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :state_changes
  has_many :punches, dependent: :destroy
  has_many :clock_ins
  has_many :clock_outs

  attr_accessor :current_password

  after_create :generate_passcode

  validates :first_name, presence: true
  validates :last_name, presence: true

  state_machine :state, initial: :registered do
    event :clock_in do
      transition to: :clocked_in, from: [:registered, :clocked_out]
    end

    event :clock_out do
      transition to: :clocked_out, from: :clocked_in
    end

    # We store all the state transitions of a user
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

  # Code to create the passcode for a user.
  # It generates random number, converto string to extract 4 digits after 0. and convert back to integer
  def generate_passcode
    update_attribute(:passcode, rand.to_s[2..5].to_i)
  end
end
