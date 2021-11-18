FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end

  factory :link do
    title { Faker::Lorem.sentence }
    slug { Faker::Internet.slug }
    url { Faker::Internet.url }
    
    user
  end
end