class LineItem < ActiveRecord::Base
	belongs_to :story
	belongs_to :developer
	
	class << self
		def ensure_developer_uniqueness(developer)
			LineItem.all.each do |line_item|
				if line_item.developer == developer
					line_item.delete
				end
			end
		end
		
		def story_line_item_less2?(story)
			if story.line_items.empty? or story.line_items.length < 2
				return true
			else
				return false
			end
		end
	end
end
