class CompanyEvent < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  belongs_to :location
  # attr_accessible :title, :body
end
