Location.destroy_all

Location.create([
  {latitude: 50.886088, longitude: -3.160458, name: "Upottery Airfield"},
  {latitude: 49.409904, longitude: -1.318183, name: "Sainte-Mere Eglise"}
  ])

puts "#{Location.all.count} locations added to the database"
