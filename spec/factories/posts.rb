FactoryBot.define do
  factory :post do
    camp_field { 'test_camp' }
    comment { 'test_comment' }
    public { 'false' }
    camped_date { '002022-07-15' }
    association :user
  end

  trait :public do
    camp_field { 'public' }
    public { 'true' }
  end

  trait :private do
    camp_field { 'private' }
    public { 'false' }
  end
end
