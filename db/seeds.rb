# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

roles = [
  'hiring',
  'student',
  'mentor',
  'admin',
  'guest'
]

roles.each do |role|
  Role.find_or_create_by_name(name: role)
end

puts "Added roles"

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup

user2 = User.find_or_create_by_email :first_name => ENV['ADMIN2_FIRST_NAME'].dup, :last_name => ENV['ADMIN2_LAST_NAME'].dup, :email => ENV['ADMIN2_EMAIL'].dup, :password => ENV['ADMIN2_PASSWORD'].dup, :password_confirmation => ENV['ADMIN2_PASSWORD'].dup

if user.roles.where(name: 'admin').empty?
  user.roles << Role.find_by_name('admin')
  user.roles << Role.find_by_name('student')
end

if user2.roles.where(name: 'admin').empty?
  user2.roles << Role.find_by_name('admin')
  user2.roles << Role.find_by_name('student')
end

puts 'users: ' 
puts user.first_name 
puts user2.first_name

student = Student.find_or_create_by_user_id :user_id => User.find_by_first_name('Holly').id, :cohort => 'Summer 2013', :city => 'Austin', :state => 'Texas', :postal_code => '78741', :linkedin => 'http://www.linkedin.com/in/hollyrgibson'

student2 = Student.find_or_create_by_user_id :user_id => User.find_by_first_name('Nick').id, :cohort => 'Summer 2013', :city => 'Austin', :state => 'Texas', :postal_code => '78701', :linkedin => 'http://www.linkedin.com/in/nickgibson'

puts 'students: ' 
puts student.user.first_name 
puts student2.user.first_name
