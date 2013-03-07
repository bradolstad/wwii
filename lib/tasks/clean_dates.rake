namespace :wwii do
  desc "Load All WWII Data"
  task :clean_dates => :environment do

    updated = 0
    Event.all.each do |event|
        puts "starting..."
        if (event.name.include?(" on ")) && (event.name.split(" on ").last.split("-").last.start_with?('19'))
          split_name = event.name.split(" on ")
          puts "event matched..."
          #puts split_name.inspect
          if new_date = DateTime.parse(split_name.last)
            #puts new_date.inspect
            split_name.delete_at(-1)
            #puts split_name.inspect
            new_name = split_name.join(" ")
            #puts new_name.inspect
            event.update_attributes(event_date:new_date,name:new_name)
            updated += 1
          end
        end
    end
    puts "Records updated: #{updated}"
  end
end
