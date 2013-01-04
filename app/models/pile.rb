class Pile < ActiveRecord::Base
	belongs_to :pileGroup

  has_one :type, :foreign_key => :typeID, :primary_key => :item_id
  end
