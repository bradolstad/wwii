class Unit < ActiveRecord::Base
  attr_accessible :name

  belongs_to :unit_type
  belongs_to :country
end
