FactoryBot.define do
  factory :myitem do
    association :user
    association :item
  end
end
