namespace :wwii do
  desc "Combine event attributes"
  task :combine => :environment do
    record = 0
    Event.all.each do |event|
      if attribute = EventAttribute.find_by_event_id(event.id)
        event.country_id = attribute.country_id
        event.operation_id = attribute.operation_id
        event.unit_id = attribute.unit_id
        event.save
        record += 1
      end
    end
    puts "Records updated: #{record}"
  end
end
