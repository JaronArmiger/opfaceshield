class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
=begin

    data = access_token.info
  	user = User.where(email: data['email']).first
  	unless user
  	  user = User.create(email: data['email'],
  	  					         password: Devise.friendly_token[0,20],
                         provider: access_token.provider,
                         uid: access_token.uid)
  	end
=end
  end
end
