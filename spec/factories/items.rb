FactoryBot.define do
  factory :item do
    item_name            { Faker::Name.initials(number: 2) }
    item_text            { Faker::Lorem.sentence }
    category_id          { 5 }
    status_id            { 3 }
    responsibility_id    { 2 }
    prefecture_id        { 23 }
    schedule_delivery_id { 2 }
    price                { 456 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
