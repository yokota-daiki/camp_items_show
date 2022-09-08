FactoryBot.define do
  factory :checklist do
    name { 'test_checklist' }
    association :user
  end
end
