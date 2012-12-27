class Pile < ActiveRecord::Base
	belongs_to :pileGroup
	
	has_one :type
end
