FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    description { Faker::Lorem.paragraph }
    total_stock { 10 }

    trait :invalid do
      total_stock { -1 }
    end

    trait :new do
      total_stock { 2 }
    end

    trait :stock_1 do
      total_stock { 0 }
    end

    trait :stock_zero do
      total_stock { 0 }
    end

    trait :with_users do
      after(:create) do |book|
        create(:user_book, book: book, user: create(:user))
      end
    end
  end
end
