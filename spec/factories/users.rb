FactoryBot.define do
  factory :user do
    sequence(:name, 'name_1')
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :generl }
  end

  trait :admin do
    sequence(:name, 'admin_1')
    role { 'admin' }
  end

  trait :generl do
    sequence(:name, 'generl_1' )
    role { 'generl' }
  end
end
