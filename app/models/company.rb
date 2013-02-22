class Company < ActiveRecord::Base
  belongs_to :unit_type
  belongs_to :icon
  attr_accessible :name, :size
end
