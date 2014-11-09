FactoryGirl.define do
  factory :karma_point do
    user
    value 0
    label { Faker::Lorem.word }
  end
end
