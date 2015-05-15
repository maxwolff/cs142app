class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :photo
	validate :validate_comment
	def validate_comment
 		if comment.length == 0  then
 			errors.add(:comment, "must be longer")
 		end
 	end
end
