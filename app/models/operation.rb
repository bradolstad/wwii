class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id

  belongs_to :campaign

  has_many :event_attributes
  has_many :events, :through => :event_attributes

  def start_date
    if self.events.where('event_date').order(:event_date).first
      return self.events.where('event_date').order(:event_date).first.event_date
    end
  end

  def end_date
    if self.events.where('event_date').order(:event_date).last
      return self.events.where('event_date').order(:event_date).last.event_date
    end
  end

  def boundaries
    locations = self.events.collect { |event| {lat:event.lat,lng:event.lng} }
    return locations.uniq
  end
end
