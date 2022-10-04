FactoryBot.define do
  factory :bookmark_camp do
    association :user
    association :camp_field
  end
end
