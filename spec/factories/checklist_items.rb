FactoryBot.define do
  factory :checklist_item do
    association :checklist
    association :item
  end
end
