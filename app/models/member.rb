class Member < ActiveRecord::Base
	belongs_to :district
	belongs_to :entity
	belongs_to :group
end
