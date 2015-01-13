FactoryGirl.define do
  factory :company do
    name "Test Company"
    description "Test description"
    primary_contact_name "pcn"
    email                "Test@ema.il"
    phone                "Test phone"
    addr_fb              "http://test.fb"
    addr_tw              "http://test.tw"
    addr_ins             "http://test.ig"
    addr_lin             "http://test.li"
  end
end