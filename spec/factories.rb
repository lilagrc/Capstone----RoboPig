FactoryGirl.define do  factory :inventory do
    pet_id 1
current_supply 1
feeding_amount 1
  end
  factory :schedule do
    time "MyString"
  end
  factory :request do
    body "MyString"
  end
  factory :tweet do

  end

  factory :user do
    id 1
    name "Scully"
    uid "1234"
    provider "twitter"
    pet_id 1
  end

  factory :pet do
    id 1
    name "Mulder"
    breed "Siamese"
    api_key "1234"
  end

  factory :feeding do
    id 1
    amount 2
    pet_id 1
  end
end





