require 'faker'

FactoryGirl.define do
  factory :conversation do
    title    { Faker::Pokemon.name }
    description    { Faker::Lorem.characters(40) }
  end
end
