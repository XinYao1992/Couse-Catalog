# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

#read course data into database
file = File.read('./lib/course.json')
data_hash_list = JSON.parse(file)
data_hash_list.each do |data_hash|
  Course.create({course_id: data_hash['id'], code: data_hash['code'], name: data_hash['name']})
end

#read instructor data into database
file = File.read('./lib/subject.json')
data_hash_list = JSON.parse(file)
data_hash_list.each do |data_hash|
  Subject.create({subject_id: data_hash['id'], name: data_hash['name'], abbreviation: data_hash['abbreviation']})
end

#read subject data into database
file = File.read('./lib/instructor.json')
data_hash_list = JSON.parse(file)
data_hash_list.each do |data_hash|
  Instructor.create({instructor_id: data_hash['id'], instructor_email: data_hash['email'], first: data_hash['first'], middle: data_hash['middle'], last: data_hash['last']})
end
