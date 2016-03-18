# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
2.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password,activated: true, activated_at: Time.zone.now)
end


training_type = ["Beacon & Recco", "Lift Evac", "Rope Rescue", "Avalanche Routes", "Funitel Evac", "Toboggan", "Dog Training", "Misc."]
training_type.each do |t|
  TrainingDivision.create!(training_type: t )
end

codes = [['5000 - Transceiver', 5000],['5001 - Transceiver-Single Burial', 5001],['5002 - Transceiver-Multiple Burial', 5002], ['5100 - RECCO', 5100], ['5101 - RECCO-Single Burial', 5101], ['5102 - RECCO-Multiple Burial', 5102], ['5103 - Personal Noise', 5103], ['3000 - Lift Evacuation', 3000], ['3002 - Level 2 - Basic Cable Sliding', 3002], ['3003 - Level 3 - Advanced Cable Sliding', 3003], ['3004 - Tower Climbing', 3004], ['3005 - Tyrolian Traverse', 3005], ['3006 - Toboggan Evac', 3006], ['8000 - Rope Rescue', 8000], ['8001 - Knots', 8001], ['8002 - Anchors', 8002], ['8003 - Belay Systems', 8003], ['8004 - Raising/Lowering Systems', 8004], ['8005 - Window Washer', 8005], ['8006 - Spider Harness', 8006], ['Funitel Evacuation', 7000], ['Roll Cab', 7001], ['Cabin Operations', 7003], ['ID training', 7004], ['Gear Orientation', 7005], ['General Toboggan Training', 2000], ['Single Tail Rope', 2001], ['Double Tail Rope', 2002], ['Toboggan Belay', 2003], ['Chair Bracket Shirley Lake', 2004], ['Chair Bracket Solitude', 2005], ['Dog Training', 6000], ['Dog Validation', 6000],['First Aid', 6100], ['Helicopter Safety', 6004], ['Incident Investigation', 6201], ['Ski Clinic', 6001], ['Other', 6000], ['Red Dog East', 11], ['Poulsen\'s East Gully', 13], ['Red Dog Lift Line', 15], ['Pouldsen\'s West Gully', 17], ['Old Red Dog', 19], ['Red Dog Ridge', 21], ['Downhill - East Face', 22], ['Downhill - GS Cliffs', 23], ['Nose', 25], ['West Face', 26], ['Rock Garden', 27], ['Saddle', 28], ['Cornice II', 31], ['Slot', 33], ['Headwall', 35], ['Palisades', 37], ['Gold Coast Ridge', 41], ['Emigrant Backside', 42], ['Roof / Funnel', 43], ['American River Traverse', 44], ['Ledges', 45], ['Granite Chief Peak', 46], ['Broken Arrow', 47], ['Tower 16', 48], ['Silverado Rim', 50], ['West Rim(Bailey\'s)', 51], ['Van Dyke\'s', 52], ['China Wall, Kima\'s', 53], ['East Rim(Tram)', 54], ['Hanging Garden', 55], ['Far Side', 57], ['Aztec / Medusa', 59]]

codes.each do |t|
  TrainingCode.create!(training_name: t[0], code: t[1])
end

