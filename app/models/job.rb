class Job < ActiveRecord::Base
	 extend FriendlyId
    friendly_id :title, use: [:slugged, :history] 
end
