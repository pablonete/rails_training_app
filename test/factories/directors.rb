FactoryBot.define do
  factory :director do
    name { Faker::Name.name }
    age { rand(100) }

    trait :with_movies do
      movies { Array.new(3) { association(:movie, director: instance) } }
    end

    trait :older_than_forty do
      age { 40 + rand(60) }
    end
  end
end
