class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :username, presence: true
  validates :email, presence: true, format: { with: /^[^@\s]+@[^@\s]+\.[^@\s]+$/, multiline: true }
  validates :password, presence: true, length: { within: 6..20 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
