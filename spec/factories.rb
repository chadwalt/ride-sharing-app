FactoryBot.define do
  factory :user do
    uid '12343232'
    provider 'google'
    name 'test'
    email 'test@gmail.com'
    image_url 'photo.jpg'
  end
end