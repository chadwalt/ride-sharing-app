FactoryBot.define do
  factory :ride_offer_interest do
    id 1
    ride_offer 1
    user_id 2
  end

  factory :ride_offer do
    id 1
    origin "origin"
    destination "destination"
    take_off "2018-08-14 21:53:00"
    no_of_people 1
    user_id 2
  end

  factory :user do
    id 2
    uid '12343232'
    provider 'google'
    name 'test'
    email 'test@gmail.com'
    image_url 'photo.jpg'
  end
end