require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  self.table_name = 'stores'
  has_many :employees
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_apparel
  
  def must_carry_apparel
    if !mens_apparel.present? && !womens_apparel.present?
      errors.add(:mens_apparel, "must carry at least one of men's or women's apparel")
      errors.add(:womens_apparel, "must carry at least one of men's or women's apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  self.table_name = 'employees'
  belongs_to :store
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

print "Enter a store name: "
store_name = gets.chomp

new_store = Store.new(name: store_name)
new_store.save

if new_store.errors.any?
  puts "Errors: "
  new_store.errors.full_messages.each do |message|
    puts message
  end
end


