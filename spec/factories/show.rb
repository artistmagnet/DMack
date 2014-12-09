FactoryGirl.define do
  factory :show do
    production
    venue
    date Date.today
    opening_date_mask 7
  end
end