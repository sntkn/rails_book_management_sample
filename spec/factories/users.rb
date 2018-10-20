FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(10) }

    trait :with_books do
      after(:create) do |user|
        create(:user_book, user: user, book: create(:book))
      end
    end
  end
end
