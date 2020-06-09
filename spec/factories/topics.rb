require 'faker'

FactoryGirl.define do
  factory :topic do
    title    { Faker::Pokemon.name }
    description    { Faker::Lorem.characters(40) }
  end
end
