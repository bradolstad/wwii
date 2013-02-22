class CompanyEvent < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  # attr_accessible :title, :body
end
