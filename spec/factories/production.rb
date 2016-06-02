FactoryGirl.define do
  factory :production do
    name Faker::Book.title
    description Faker::Lorem.paragraph
    company
    director
    dirname ''
    diremail ''

    after(:create) do |production, evaluator|
      create_list(:show, 1, production: production)
    end
  end
end