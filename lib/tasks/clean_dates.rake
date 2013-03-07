namespace :wwii do
  desc "Load All WWII Data"
  task :clean_dates => :environment do

    updated = 0
    Event.all.each do |event|
        if (event.name.include?(" on ")) && (event.name.split(" on ").last.split("-").last.start_with?('19'))
          split_name = event.name.split(" on ")
          puts "Event matched... #{event.name}"
          if new_date = DateTime.parse(split_name.last)
            split_name.delete_at(-1)
            new_name = split_name.join(" ")
            event.update_attributes(event_date:new_date,name:new_name)
            updated += 1
          end
        end
    end
    puts "Records updated: #{updated}"
  end
end
