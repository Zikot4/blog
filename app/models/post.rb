class Post < ApplicationRecord
	acts_as_votable
	self.per_page = 7

	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy

end
