class Comment < ApplicationRecord
	has_attached_file :file, styles: { medium: "600x450>", thumb:"53x80#"}
	validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

	belongs_to :commentable, polymorphic: true
end
