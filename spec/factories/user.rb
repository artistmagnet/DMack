FactoryGirl.define do
  sequence(:email) { |n| "testuser#{n}@artistmagnet.com" }
  factory :user do
    email
    password "password"
  end
end