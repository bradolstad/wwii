class Unit < ActiveRecord::Base
  attr_accessible :name, :old_id, :unit_type_id, :country_id, :unit_class_id, :icon_id

  belongs_to :unit_type
  belongs_to :country
  has_many :events
  belongs_to :unit_class
  belongs_to :icon

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
