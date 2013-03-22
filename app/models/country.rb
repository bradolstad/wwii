class Country < ActiveRecord::Base
  attr_accessible :name, :old_id, :flag_path

  has_many :units
  has_many :events, :through=>:units

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
