FactoryGirl.define do
  factory :role do
    name Faker::Superhero.name
    resume
    production
    director
    diremail ''
    dirname ''
  end
end