FactoryGirl.define do
  factory :production do
    name "Test Production"
    description "Test description"
    company
    director
    dirname ''
    diremail ''

    after(:create) do |production, evaluator|
      create_list(:show, 1, production: production)
    end
  end
end