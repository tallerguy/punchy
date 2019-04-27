FactoryBot.define do
  factory :punch do
    user
    punch_type { Punch::TYPES.values.sample }
    punched_at { DateTime.now }
  end
end
