namespace :wwii do
  desc "fix dates"
  task :clean_dates => :environment do
    updated = 0
    Event.all.each do |event|
        if (event.name.include?(" on ")) && (event.name.split(" on ").last.split("-").last.start_with?('19'))
          split_name = event.name.split(" on ")
          puts "Event matched: #{event.name}"
          if new_date = DateTime.parse(split_name.last)
            split_name.delete_at(-1)
            new_name = split_name.join(" ")
            puts "Name: #{new_name}, Date: #{new_date}"
            event.update_attributes(event_date:new_date,name:new_name)
            updated += 1
          end
        end
    end
    puts "Records updated: #{updated}"
  end

  desc "Add country flags to database"
  task :flags => :environment do
    country_flags = [{:name=>"United States", :flag_path=>"usa-flag.jpg"}, {:name=>"United Kingdom", :flag_path=>"uk-flag.jpg"}, {:name=>"Canada", :flag_path=>"canada-flag.jpg"}, {:name=>"France", :flag_path=>"france-flag.jpg"}, {:name=>"Poland", :flag_path=>"poland-flag.jpg"}, {:name=>"Norway", :flag_path=>"norway-flag.jpg"}, {:name=>"Australia", :flag_path=>"australia-flag.jpg"}, {:name=>"New Zealand", :flag_path=>"new-zealand-flag.jpg"}, {:name=>"Netherlands", :flag_path=>"netherlands-flag.jpg"}, {:name=>"Czechoslovakia", :flag_path=>"czech-flag.jpg"}, {:name=>"Belgium", :flag_path=>"belgium-flag.jpg"}, {:name=>"Greece", :flag_path=>"greece-flag.jpg"}, {:name=>"South Africa", :flag_path=>"south-africa-flag.jpg"}, {:name=>"India", :flag_path=>"india-flag.jpg"}]
    record = 0
    country_flags.each do |country|
      if h = Country.find_by_name(country[:name])
        h.update_attributes(:flag_path=>country[:flag_path])
        record += 1
      end
    end
    puts "Countries Updated: #{record}"
  end

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

  desc "Fix Event Types"
  task :unit_class => :environment do

    UnitClass.destroy_all
    UnitClass.create([
        {name:"Artillery"},
        {name:"Armoured"},
        {name:"Infantry"},
        {name:"Airborne"}
        ])

    puts "Unit Class created: #{UnitClass.count}"
    record = 0
    Unit.all.each do |unit|
      if unit.name.downcase.include?("airbo" || "airlanding" || "parachut" || "glider")
          unit.unit_class_id = UnitClass.find_by_name("Airborne").id

      elsif unit.name.downcase.include?("cavalry" || "mechanized" ||"armored" || "armoured" || "panzer" || "tank" )
          unit.unit_class_id = UnitClass.find_by_name("Armoured").id

      elsif unit.name.downcase.include? ("artillery" || "anti")
          unit.unit_class_id = UnitClass.find_by_name("Artillery").id

      else
          unit.unit_class_id = UnitClass.find_by_name("Infantry").id

      end
      if unit.save
        record += 1
      end

    end
    puts "Units updated: #{record}"
  end

end
