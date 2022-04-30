require 'pg'

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

        filter = sortBy != nil ? (sortBy == "name" ? "ORDER BY full_name ASC" : "ORDER BY vehicle_type ASC" ): ""
        query =  ("SELECT * from outdoorsy_users " + filter).strip

        conn = PG.connect(:dbname => 'wanderlust_development')
        conn.exec(query + ";") do |result| 
            result.each do |row| 
                res = row.values_at('full_name', 'email', 'vehicle_type', 'vehicle_name', 'vehicle_length')
                fullName = res[0]
                email = res[1]
                vehicleType = res[2]
                vehicleName = res[3]
                vehicleLength = res[4].to_i >= 12 ? res[4] + ' inches (' + (res[4].to_f / 12).truncate(1).to_s + 'ft)': res[4] + ' inches'

                puts fullName + ' ' + email + ' ' + vehicleType + ' ' + vehicleName + ' ' + vehicleLength
                puts "\n"

            end
        end
     end
end
