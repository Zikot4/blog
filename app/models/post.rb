class Post < ApplicationRecord
	self.per_page = 7
	
	belongs_to :user


end
