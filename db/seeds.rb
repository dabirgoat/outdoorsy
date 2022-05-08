# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

OutdoorsyUser.destroy_all #Clear state

commaData = File.join(Rails.root, 'lib/seeds', 'commas.txt')
pipeData = File.join(Rails.root, 'lib/seeds', 'pipes.txt')

[commaData,pipeData].each().with_index do |file,index|
    sep = index == 0 ? ',' : '|'
    File.foreach(file).with_index do |line|
        row = line.split(sep)
        firstName = row[0].strip
        lastName = row[1].strip
        email = row[2].strip
        vehicleType = row[3].strip
        vehicleName = row[4].strip
        vehicleLength = row[5].strip.split()[0]

        outdoorsyUser = OutdoorsyUser.create(full_name: firstName + ' ' + lastName, first_name: firstName, last_name: lastName, email: email, vehicle_type: vehicleType,
                                             vehicle_name: vehicleName, vehicle_length: vehicleLength)
        
     end
 end
