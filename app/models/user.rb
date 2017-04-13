class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable

    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable,
            :validatable,:omniauthable,
             :omniauth_providers  => [:facebook,:google_oauth2,:github]


    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_create do |user|
            user.email = auth.info.email
            user.first_name = auth.info.name
            user.image = auth.info.image
            user.password = Devise.friendly_token[0,20]
            user.id
        end
	end

    has_many :posts
    has_many :comments, dependent: :destroy

    has_many :accounts, dependent: :destroy
end
