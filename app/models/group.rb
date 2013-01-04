class Group < ActiveRecord::Base
  establish_connection :sde
  set_table_name :invGroups
  set_primary_key :groupID
  alias_attribute :name, :groupName
  #groupID, categoryID, description, iconId, useBasePrice, allowManufacture, allowRecycler 	anchored 	anchorable 	fittableNonSingleton 	published

  has_many :types, :foreign_key => :groupID, :primary_key => :groupID
  belongs_to :category, :foreign_key => :categoryID, :primary_key => :categoryID
end
