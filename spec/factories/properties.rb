FactoryGirl.define do
  factory :property do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
  end
end