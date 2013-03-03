class Unit < ActiveRecord::Base
  attr_accessible :name, :old_id

  belongs_to :unit_type
  belongs_to :country
end
