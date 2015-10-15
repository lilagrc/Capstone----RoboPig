FactoryGirl.define do  factory :tweet do

  end

  factory :user do
    id 1
    name "Scully"
    uid "1234"
  end

  factory :pet do
    id 1
    name "Mulder"
    breed "Siamese"
  end

  factory :feeding do
    id 1
    amount 2
    pet_id 1
  end
end





