# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Subscription.destroy_all
Tea.destroy_all
TeaService.destroy_all

customer = Customer.create!( first_name: 'Maria', last_name: 'Gonzalez', email: 'maria@email.com', address: '222 Somewherecute ave' )

subscription_1 = Subscription.create!( title: 'Summer Time', price: 12.99, status: 0, frequency: 'one time purchase', customer_id: customer.id )
subscription_2 = Subscription.create!( title: 'Fall Time', price: 29.99, status: 1, frequency: 'weekly', customer_id: customer.id )
subscription_3 = Subscription.create!( title: 'Winter Time', price: 29.99, status: 1, frequency: 'weekly', customer_id: customer.id )
subscription_4 = Subscription.create!( title: 'Spring Time', price: 12.99, status: 0, frequency: 'monthly', customer_id: customer.id )

tea_1 = Tea.create!( title: 'Green tea', description: 'organic energy', temperature: '100-106 F', brew_time: 'boil and simmer to taste')
tea_2 = Tea.create!( title: 'Peppermint tea', description: 'peppermint flavor', temperature: '100-106 F', brew_time: 'boil and simmer to taste')
tea_3 = Tea.create!( title: 'Black tea', description: 'organic energy', temperature: '100-106 F', brew_time: 'boil and simmer to taste')
tea_4 = Tea.create!( title: 'Chamomille tea', description: 'Soothing', temperature: '100-106 F', brew_time: 'boil and simmer to taste')
tea_5 = Tea.create!( title: 'Rose tea', description: 'heartbreak tea', temperature: '100-106 F', brew_time: 'boil and simmer to taste')
tea_6 = Tea.create!( title: 'White tea', description: 'taste good', temperature: '100-106 F', brew_time: 'boil and simmer to taste')

service_1 = TeaService.create!( tea_id: tea_1.id, subscription_id: subscription_1.id )
service_2 = TeaService.create!( tea_id: tea_1.id, subscription_id: subscription_2.id )
service_3 = TeaService.create!( tea_id: tea_2.id, subscription_id: subscription_2.id )
service_4 = TeaService.create!( tea_id: tea_5.id, subscription_id: subscription_3.id )
service_5 = TeaService.create!( tea_id: tea_6.id, subscription_id: subscription_4.id )
