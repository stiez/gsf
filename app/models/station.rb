class Station < ActiveRecord::Base
	establish_connection :sde
	set_table_name :staStations
	set_primary_key :stationID
	alias_attribute :name, :stationName

	has_many :PileGroups
end
