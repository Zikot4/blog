class Account < ApplicationRecord


    def self.from_omniauth(auth,id)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |account|
            account.provider = auth.provider
            account.uid = auth.uid
            account.user_id = id
        end
    end

    belongs_to :user
end
