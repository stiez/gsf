class Type < ActiveRecord::Base
	establish_connection :sde
	set_table_name :invTypes
	set_primary_key :typeID
	alias_attribute :name, :typeName

	has_many :PileGroups
end
