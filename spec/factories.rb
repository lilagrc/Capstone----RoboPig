FactoryGirl.define do  factory :request do
    body "MyString"
  end
  factory :tweet do

  end

  factory :user do
    id 1
    name "Scully"
    uid "1234"
    provider "twitter"
    api_key "1234"
  end

  factory :pet do
    id 1
    name "Mulder"
    breed "Siamese"
    user_id 1
  end

  factory :feeding do
    id 1
    amount 2
    pet_id 1
  end
end





