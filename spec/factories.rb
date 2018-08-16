FactoryBot.define do
  factory :ride_offer do
    origin "origin"
    destination "destination"
    take_off "2018-08-14 21:53:00"
    no_of_people 1
  end

  factory :user do
    uid '12343232'
    provider 'google'
    name 'test'
    email 'test@gmail.com'
    image_url 'photo.jpg'
  end
end