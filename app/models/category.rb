class Category < ActiveRecord::Base
  establish_connection :sde
  set_table_name :invCategories
  set_primary_key :categoryID
  alias_attribute :name, :categoryName
  #categoryID, description, iconID, published

  has_many :groups, :foreign_key => :categoryID, :primary_key => :categoryID
end
