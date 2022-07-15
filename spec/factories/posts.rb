FactoryBot.define do
  factory :post do
    user { nil }
    camp_field { "MyString" }
    comment { "MyString" }
    public { false }
    camped_date { "2022-07-15" }
  end
end
