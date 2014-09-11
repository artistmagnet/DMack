# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Venue.count == 0
  puts "creating Venues"
  venues = Venue.create(
    [
      {
        name:     "SHN Orpheum",
        address1: "1192 Market St.",
        address2: "",
        city:     "San Francisco",
        zipcode:  "94102",
        state:    "CA",
        country:  "United States",
        description: "HN gained ownership of the Orpheum in 1981, and in 1998 launched a multimillion-dollar restoration, enlarging the stage to accommodate larger touring Broadway shows. Among its many accolades, the Orpheum Theatre is an official San Francisco designated landmark and presented the U.S. premiere of the hit Broadway musical Mamma Mia! in 2000."
      },
      {
        name:     "The Minskoff",
        address1: "200 West 45th Street",
        address2: "",
        city:     "New York",
        zipcode:  "10036",
        state:    "NY",
        country: "United States",
        description: "Opened in 1973, the theatre was named for Sam Minskoff and Sons, one of New York's distinguished real estate families."
      },
    ])
end

if Company.count == 0
  puts "Creating Companies"
  companies = Company.create([
     {
       name:      "The Industry",
       primary_contact_name: "theindustryla.org",
       description:"The Industry creates experimental productions that expand the traditional definition of opera.  By merging media and through interdisciplinary collaborations, we produce works that inspire new audiences for the art form.  We believe that new opera opens space for imagination, engagement, dialogue, and connection.  The Industry serves as an incubator for new talent and for artists predominantly based in Los Angeles."
     },

     {
       name:      "Huntington",
       primary_contact_name: "http://www.huntingtontheatre.org/",
       description:"The Huntington brings together world-class theatre artists from Boston, Broadway, and beyond with the most promising new talent to create eclectic seasons of exciting new works and classics made current."
     }


   ])
end
