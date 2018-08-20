class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :omniauthable, omniauth_providers: %i[google_oauth2]

  validates_presence_of :provider
  validates_presence_of :email
  validates_presence_of :uid

  has_many :ride_offers, :dependent => :destroy
  has_many :ride_offer_interests, through: :ride_offers

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.image_url = auth.info.image
    end
  end
end
