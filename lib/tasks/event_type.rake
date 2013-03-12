namespace :wwii do
  desc "Fix Event Types"
  task :event_type_fix => :environment do
    record = 0
    eventtype = EventType.where(name:"Plane Crash").first
    Event.all.each do |event|
      if event.name && event.name.include?(' lost at ')
        event.update_attributes(event_type_id:eventtype.id)
        record += 1
      end
    end
    puts "Records updated: #{record}"
  end
end
