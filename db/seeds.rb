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
  'guest',
  'staff'
]

roles.each do |role|
  Role.find_or_create_by_name(name: role)
end

puts "Added roles"

user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup

user2 = User.find_or_create_by_email :first_name => ENV['ADMIN2_FIRST_NAME'].dup, :last_name => ENV['ADMIN2_LAST_NAME'].dup, :email => ENV['ADMIN2_EMAIL'].dup, :password => ENV['ADMIN2_PASSWORD'].dup, :password_confirmation => ENV['ADMIN2_PASSWORD'].dup

user3 = User.find_or_create_by_email :first_name => ENV['MENTOR_FIRST_NAME'].dup, :last_name => ENV['MENTOR_LAST_NAME'].dup, :email => ENV['MENTOR_EMAIL'].dup, :password => ENV['MENTOR_PASSWORD'].dup, :password_confirmation => ENV['MENTOR_PASSWORD'].dup

user4 = User.find_or_create_by_email :first_name => ENV['STAFF_FIRST_NAME'].dup, :last_name => ENV['STAFF_LAST_NAME'].dup, :email => ENV['STAFF_EMAIL'].dup, :password => ENV['STAFF_PASSWORD'].dup, :password_confirmation => ENV['STAFF_PASSWORD'].dup

user5 = User.find_or_create_by_email :first_name => ENV['HIRING_FIRST_NAME'].dup, :last_name => ENV['HIRING_LAST_NAME'].dup, :email => ENV['HIRING_EMAIL'].dup, :password => ENV['HIRING_PASSWORD'].dup, :password_confirmation => ENV['HIRING_PASSWORD'].dup

if user.roles.where(name: 'admin').empty?
  user.roles << Role.find_by_name('admin')
  user.roles << Role.find_by_name('student')
end

if user2.roles.where(name: 'admin').empty?
  user2.roles << Role.find_by_name('admin')
  user2.roles << Role.find_by_name('student')
end

if user3.roles.where(name: 'mentor').empty?
  user3.roles << Role.find_by_name('mentor')
end

if user4.roles.where(name: 'staff').empty?
  user4.roles << Role.find_by_name('staff')
end

if user5.roles.where(name: 'hiring').empty?
  user5.roles << Role.find_by_name('hiring')
end

puts 'users:' 
puts user.first_name 
puts user2.first_name
puts user3.first_name
puts user4.first_name
puts user5.first_name

student = Student.find_or_create_by_user_id :user_id => User.find_by_first_name('Holly').id, :cohort => 'Summer 2013', :city => 'Austin', :state => 'Texas', :postal_code => '78741', :linkedin => 'http://www.linkedin.com/in/hollyrgibson', :developer_type => 'Full Stack Developer', :job_status => 'Available for Hire', :entrepreneur => 'not looking', :mentor => 'Available to Mentor', :gmaps => 'true'

student2 = Student.find_or_create_by_user_id :user_id => User.find_by_first_name('Nick').id, :cohort => 'Summer 2013', :city => 'Austin', :state => 'Texas', :postal_code => '78701', :linkedin => 'http://www.linkedin.com/in/nickgibson', :developer_type => 'Full Stack Developer', :job_status => 'Available for Hire', :entrepreneur => 'not looking', :mentor => 'Available to Mentor', :gmaps => 'true'

puts 'students: ' 
puts student.user.first_name 
puts student2.user.first_name

mentor = Mentor.find_or_create_by_user_id :user_id => User.find_by_first_name('Brad').id, :city => 'Austin', :state => 'Texas', :postal_code => '78701', :linkedin => 'http://www.linkedin.com/in/bradfults', :developer_type => 'Full Stack Developer', :gmaps => 'true'

puts 'mentor: ' 
puts mentor.user.first_name 

staff = StaffMember.find_or_create_by_user_id :user_id => User.find_by_first_name('Matt').id, :city => 'Austin', :state => 'Texas', :postal_code => '78752', :linkedin => 'http://www.linkedin.com/in/mattbuck', :developer_type => 'Full Stack Developer', :gmaps => 'true'

puts 'staff: ' 
puts staff.user.first_name 

hiring = HiringPartner.find_or_create_by_user_id :user_id => User.find_by_first_name('Lance').id, :linkedin => 'http://www.linkedin.com/in/lancevaughn', :gmaps => 'true'

puts 'hiring: ' 
puts hiring.user.first_name


