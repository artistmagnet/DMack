FactoryGirl.define do
  factory :venue do
    name "Test Venue"
    address1 "addr1"
    address2 "addr2"
    zipcode  20100
    city     "Houston"
    state    "Texas"
    country  "United States"
    description "Test description"
    email                "Test@ema.il"
    phone                "Test phone"
    addr_fb              "http://test.fb"
    addr_tw              "http://test.tw"
    addr_ins             "http://test.ig"
    addr_lin             "http://test.li"
  end
end