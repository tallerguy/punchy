FactoryBot.define do
  factory :user do
    first_name  {"John"}
    last_name   {"Doe"}
    email       { Faker::Internet.email }
    gender      { Faker::Gender.binary_type }
    password    {Faker::Internet.password}
    password_confirmation    {password}
  end
end
