class Company < ActiveRecord::Base
  attr_accessible :name, :size

  belongs_to :unit_type
  belongs_to :icon

  has_many :company_events
  has_many :events, :through => :company_events

end
