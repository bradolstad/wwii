class Unit < ActiveRecord::Base
  attr_accessible :name, :old_id, :unit_type_id, :country_id, :unit_class_id

  belongs_to :unit_type
  belongs_to :country
  has_many :events
  belongs_to :unit_class

  validates_presence_of :name
  validates_uniqueness_of :name
end
