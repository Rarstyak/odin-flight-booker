# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# See gist https://gist.github.com/arjunvenkat/1115bc41bf395a162084

require 'csv'

csv_airport_codes_text = File.read(Rails.root.join('lib', 'seeds', 'airport_codes.csv'))
csv_airport_codes = CSV.parse(csv_airport_codes_text, :headers => true, :encoding => 'ISO-8859-1')
csv_airport_codes.each do |row|
  airport = Airport.new
  airport.city = row['City']
  airport.country = row['Country']
  airport.code = row['Code']
  airport.continent = row['Continent']
  airport.save
  puts "Saved #{airport.code} at #{airport.city}, #{airport.country}, #{airport.continent}"
end

puts "Seeded #{Airport.count} airports into Airport table"
