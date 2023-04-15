require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  self.table_name = 'stores'
  has_many :employees
end
class Employee < ActiveRecord::Base
  self.table_name = 'employees'
  belongs_to :store
end
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "John", last_name: "Doe", hourly_rate: 50)
@store1.employees.create(first_name: "Jane", last_name: "Doe", hourly_rate: 55)
@store2.employees.create(first_name: "Alice", last_name: "Wonderland", hourly_rate: 45)
@store2.employees.create(first_name: "Bob", last_name: "Marley", hourly_rate: 65)
