class Job < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  enum category: [:full_time, :part_time, :freelancing, :consulting] 

end