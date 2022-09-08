FactoryBot.define do
  factory :item do
    sequence(:name, 'item_1')
    url { '' }
    maker { '' }
    category { 'tent' }
  end

  trait :tent do
    name { 'テント' }
    category { 'tent' }
  end

  trait :bedding do
    name { '寝袋' }
    category { 'bedding' }
  end

  trait :light do
    name { 'ライト' }
    category { 'light' }
  end
end
