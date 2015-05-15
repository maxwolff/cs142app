class Search
	def self.filter(substring)
		@@comments = Comment.all 
		@@comments.select { |comment| comment.comment.downcase.include?(substring.downcase) }
		@@photoResults = []
	
		@@comments.each do |comment|
			@@photoResults << comment.photo
		end
		return @@photoResults 
	end
end 

