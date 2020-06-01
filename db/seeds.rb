# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Luis')

User.first.articles.create(title: "Surprise! 2021 Chevrolet Corvette Stingray Won’t Get Price Hike", text: "In big news for Corvette fans: There will not be a price increase for the 2021 Chevrolet Corvette Stringray. It's a silver lining in the production storm that battered the launch of the C8 that was reimagined as a mid-engine sports car after 50 years of longing by Vette enthusiasts.
That means the base price for the 2021 Stingray coupe, which was the 2020 MotorTrend Car of the Year, remains at $59,995 while the convertible stays pat at $67,495. Other good news: You don't have to get the Z51 performance package to enjoy GM's excellent Magnetic Ride Control. It will be a standalone option, even on the base model, says Tadge Juechter, executive chief engineer for the Corvette.
Customers will be able to order the 2021 C8s in late July. 'We initially said we would start taking 2021 Corvette orders at the end of this month but, again, due to the plant being down for two months, we're adjusting that timing to late July,' Juechter said. 2020 model production will also be extended through most of the year o try to fill as many existing orders as possible.", image: 'corvette', image_content_type: 'jpeg')

