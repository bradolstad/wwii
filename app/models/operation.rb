class Operation < ActiveRecord::Base
  attr_accessible :name

  belongs_to :campaign

  has_many :event_attributes
  has_many :events, :through => :event_attributes
end
