# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Report.create(
  new_cases: 198,
  new_recovered: 119,
  new_deaths: 1,
  total_cases: 13500,
  total_recovered: 10567,
  total_deaths: 73,
  updated_date: '2021-01-24 06:30:00'
)
