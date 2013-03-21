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

  desc "Fix unit class"
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

  desc "Add icons to database"
  task :create_icons => :environment do
    Icon.destroy_all
    Icon.create([
      {name:"Allies: Infantry 16", path: "allies_infantry_16.png"},
      {name:"Allies: Infantry 24", path: "allies_infantry_24.png"},
      {name:"Allies: Infantry 32", path: "allies_infantry_32.png"},
      {name:"Allies: Infantry 48", path: "allies_infantry_48.png"},
      {name:"Allies: Infantry 64", path: "allies_infantry_64.png"},
      {name:"Allies: Armor 16", path: "allies_armor_16.png"},
      {name:"Allies: Armor 24", path: "allies_armor_24.png"},
      {name:"Allies: Armor 32", path: "allies_armor_32.png"},
      {name:"Allies: Armor 48", path: "allies_armor_48.png"},
      {name:"Allies: Armor 64", path: "allies_armor_64.png"},
      {name:"Allies: Artillery 16", path: "allies_artillery_16.png"},
      {name:"Allies: Artillery 24", path: "allies_artillery_24.png"},
      {name:"Allies: Artillery 32", path: "allies_artillery_32.png"},
      {name:"Allies: Artillery 48", path: "allies_artillery_48.png"},
      {name:"Allies: Artillery 64", path: "allies_artillery_64.png"},
      {name:"Axis: Infantry 16", path: "axis_infantry_16.png"},
      {name:"Axis: Infantry 24", path: "axis_infantry_24.png"},
      {name:"Axis: Infantry 32", path: "axis_infantry_32.png"},
      {name:"Axis: Infantry 48", path: "axis_infantry_48.png"},
      {name:"Axis: Infantry 64", path: "axis_infantry_64.png"},
      {name:"Axis: Armor 16", path: "axis_armor_16.png"},
      {name:"Axis: Armor 24", path: "axis_armor_24.png"},
      {name:"Axis: Armor 32", path: "axis_armor_32.png"},
      {name:"Axis: Armor 48", path: "axis_armor_48.png"},
      {name:"Axis: Armor 64", path: "axis_armor_64.png"},
      {name:"Axis: Artillery 16", path: "axis_artillery_16.png"},
      {name:"Axis: Artillery 24", path: "axis_artillery_24.png"},
      {name:"Axis: Artillery 48", path: "axis_artillery_48.png"},
      {name:"Axis: Artillery 64", path: "axis_artillery_64.png"}
      ])
      puts "Icons created: #{Icon.count}"
  end

  desc "Map units to icons"
  task :unit_icons => :environment do
    count = 0
    Unit.includes(:unit_class,:unit_type,:country).all.each do |unit|
      unit_icon = Array.new
      if unit.country.present?
        if unit.country.name == ("Germany"||"Italy")
          unit_icon << "axis"
        else
          unit_icon << "allies"
        end
      else
        unit_icon << "allies"
      end
      if unit.unit_class.present?
        if unit.unit_class.name == "Artillery"
          unit_icon << "artillery"
        elsif unit.unit_class.name == "Armoured"
          unit_icon << "armor"
        else
          unit_icon << "infantry"
        end
      else
        unit_icon << "infantry"
      end #main if

      if unit.unit_type.present?
        if unit.unit_type.name == "Corps"
          unit_icon << 64
        elsif unit.unit_type.name == "Division"
          unit_icon << 48
        elsif unit.unit_type.name == ("Brigade"||"Regiment"||"Group"||"Battalion")
          unit_icon << 32
        else
          unit_icon << 24
        end
      else
        unit_icon << 24
      end # second main if

      if unit_icon.count == 3
        unit_icon = unit_icon.join("_")
        unit_icon = unit_icon + ".png"
        unit.update_attributes(icon_id:Icon.find_by_path(unit_icon).id)
        count += 1
        puts unit_icon
      else
        puts "#{unit.id}:#{unit.name} - icon: #{unit_icon.inspect}"
      end
    end # main do
    puts "Units updated with icon: #{count}"
  end #task

  desc "Fix unit types"
  task :unit_types => :environment do
    count = 0
    puts "Units: #{Unit.count}"
    puts "Units with no type: #{Unit.where(unit_type_id:nil).count}"
    Unit.where(unit_type_id:nil).each do |unit|
      if unit.name.downcase.include?("dragoon")
          unit.unit_type_id = UnitType.find_by_name("Brigade").id
      elsif unit.name.downcase.include?("brigade")
          unit.unit_type_id = UnitType.find_by_name("Brigade").id
      elsif unit.name.downcase.include?("corps")
          unit.unit_type_id = UnitType.find_by_name("Corps").id
      elsif unit.name.downcase.include?("regiment")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("squad")
          unit.unit_type_id = UnitType.find_by_name("Squadron").id
      elsif unit.name.downcase.include?("squadron")
          unit.unit_type_id = UnitType.find_by_name("Squadron").id
      elsif unit.name.downcase.include?("hussars")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("troop")
          unit.unit_type_id = UnitType.find_by_name("Company").id
      elsif unit.name.downcase.include?("company")
          unit.unit_type_id = UnitType.find_by_name("Company").id
      elsif unit.name.downcase.include?("rifles")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("gordon")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("borderers")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("fusiliers")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("glasgow")
          unit.unit_type_id = UnitType.find_by_name("Battalion").id
      elsif unit.name.downcase.include?("battalion")
          unit.unit_type_id = UnitType.find_by_name("Battalion").id
      elsif unit.name.downcase.include?("seaforth")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("regiment")
          unit.unit_type_id = UnitType.find_by_name("Regiment").id
      elsif unit.name.downcase.include?("cornwall")
          unit.unit_type_id = UnitType.find_by_name("Battalion").id
      elsif unit.name.downcase.include?("durham")
          unit.unit_type_id = UnitType.find_by_name("Battalion").id
      elsif unit.name.downcase.include?("division")
          unit.unit_type_id = UnitType.find_by_name("Division").id
      elsif unit.name.downcase.include?("group")
          unit.unit_type_id = UnitType.find_by_name("Group").id
      else
        puts "Not matched: #{unit.name}"
      end
      if unit.save
        count += 1
      end

    end # do loop
    puts "Units updated with type: #{count}"
  end # task

  desc "Remove country from unit names"
  task :unit_name_fix => :environment do
    puts "Starting..."
    count = 0
    not_matched = []
    matched = []
    Unit.all.each do |unit|
      if unit.name.scan(/\(..?.?\)/).present?
        new_name = unit.name.sub(/\w?\(..?.?\)\w?/,'')
        matched << new_name
        if unit.update_attributes(name: new_name)
          count += 1
        else
          puts "Failed update: #{unit.name} - #{unit.id}"
        end
      else
        not_matched << unit.name
      end
    end
    puts "Not matched: #{not_matched.inspect}"
    puts "Matched: #{matched.inspect}"
    puts "Total Units: #{Unit.count}"
    puts "Updated: #{count}"
  end #task
end # namespace
