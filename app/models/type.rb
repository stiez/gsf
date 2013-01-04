class Type < ActiveRecord::Base
	establish_connection :sde
	set_table_name :invTypes
	set_primary_key :typeID
	alias_attribute :name, :typeName
  #typeID 	groupID 	description 	mass 	volume 	capacity 	portionSize 	raceID 	basePrice 	published 	marketGroupID 	chanceOfDuplicating 	radius 	iconID 	graphicID 	soundID

	has_many :pile_groups
  belongs_to :group, :foreign_key => :groupID, :primary_key => :groupID
end
