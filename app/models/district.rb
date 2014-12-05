class District < ActiveRecord::Base
	belongs_to :entity
	has_one :member
end
