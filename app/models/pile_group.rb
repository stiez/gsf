class PileGroup < ActiveRecord::Base
	has_many :piles
	belongs_to :station, :primary_key => :stationID
end
