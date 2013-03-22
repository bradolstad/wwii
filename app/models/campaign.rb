class Campaign < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :operations
  has_many :events, :through => :operations

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
