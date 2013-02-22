class Company < ActiveRecord::Base
  belongs_to :unit_type
  belongs_to :icon
  has_many :company_events
  has_many :events, :through => :company_events
  attr_accessible :name, :size
end
