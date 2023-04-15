require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
total_revenue = Store.sum(:annual_revenue)
puts "The total revenue for the entire company is $#{total_revenue}."
average_revenue = Store.average(:annual_revenue)
puts "The average annual revenue for all stores is $#{average_revenue}."
num_high_revenue_stores = Store.where('annual_revenue >= ?', 1000000).count
puts "#{num_high_revenue_stores} stores are generating $1M or more in annual sales."
