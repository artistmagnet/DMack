FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    description "Test description"
    primary_contact_name "pcn"
    email                "Test@ema.il"
    phone                "Test phone"
    addr_fb              "http://test.fb"
    addr_tw              "http://test.tw"
    addr_ins             "http://test.ig"
    addr_lin             "http://test.li"
    city                 "NY"
    country              "US"
  end
end