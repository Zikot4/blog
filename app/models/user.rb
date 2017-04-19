class User < ApplicationRecord
    acts_as_voter
    has_attached_file :image, styles: { medium: "150x150>", thumb: "50x50>" }, :default_url => "/system/users/images/missing/photo_:style.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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
