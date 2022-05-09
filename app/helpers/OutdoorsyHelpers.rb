require 'sqlite3'

class OutdoorsyHelpers
    def getUsers(sortBy = nil)

        if sortBy != nil && sortBy != 'name' && sortBy != 'vehicle'
            puts "\nINVALID INPUT"
            puts "\n"
            puts "sortBy Parameter must be 'name', 'vehicle', or nil"
            puts "\n"
            return
        end

        puts "\nFull Name | Email | Vehicle Type | Vehicle Name | Vehicle Length"
        puts "\n"

        filter = sortBy != nil ? (sortBy == "name" ? "ORDER BY lower(full_name) ASC" : "ORDER BY lower(vehicle_type) ASC" ): ""
        query =  ("SELECT * from outdoorsy_users " + filter).strip

       
        db = SQLite3::Database.open 'wanderlust_development'
        results = db.query query
        results.each { |row| 
            fullName = row[1]
            email = row[4]
            vehicleType = row[5]
            vehicleName = row[6]
            vehicleLength = row[7].to_s + ' ft'

            puts fullName + ' | ' + email + ' | ' + vehicleType + ' | ' + vehicleName + ' | ' + vehicleLength
            puts "\n"
    
        }

     end
end
