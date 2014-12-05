class Entity < ActiveRecord::Base
	has_many :districts, dependent: :destroy
	has_many :members, through: :districts
end
