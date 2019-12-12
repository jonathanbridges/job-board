# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'open-uri'
require 'faker'

Company.delete_all
User.delete_all
Opening.delete_all
Application.delete_all

### Companies ###

company_names = []
4.times do
  company_names.push(Faker::Company.unique.name)
end

company_1 = Company.create(company_name: "Fountain")
company_2 = Company.create(company_name: company_names.pop())
company_3 = Company.create(company_name: company_names.pop())
company_4 = Company.create(company_name: company_names.pop())
company_5 = Company.create(company_name: company_names.pop())

### Users ###

# Employers #

email_addresses = []
names = []

23.times do
  email_addresses.push(Faker::Internet.unique.email)
  names.push(Faker::Name.unique.name)
end

employer_1 = User.create(email: "demo_employer@fountain.com", name: "Demo Employer", password: "password", is_employer: true, company_id: company_1.id)
employer_2 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password", is_employer: true, company_id: company_2.id)
employer_3 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password", is_employer: true, company_id: company_3.id)
employer_4 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password", is_employer: true, company_id: company_4.id)
employer_5 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password", is_employer: true, company_id: company_5.id)

# Applicants #

applicant_1 = User.create(email: "demo_applicant@jobboard.com", name: "Demo Applicant", password: "password")
applicant_2 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_3 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_4 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_5 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_6 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_7 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_8 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_9 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_10 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_11 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_12 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_13 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_14 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_15 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_16 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_17 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_18 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_19 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")
applicant_20 = User.create(email: email_addresses.pop(), name: names.pop(), password: "password")

### Openings ###

titles = []
descriptions = []

20.times do
  titles.push(Faker::Job.unique.title)
  descriptions.push(Faker::Company.unique.bs)
end

4.times do
  Opening.create(title: titles.pop(), description: descriptions.pop(), company_id: company_1.id)
end

4.times do
  Opening.create(title: titles.pop(), description: descriptions.pop(), company_id: company_2.id)
end

4.times do
  Opening.create(title: titles.pop(), description: descriptions.pop(), company_id: company_3.id)
end

4.times do
  Opening.create(title: titles.pop(), description: descriptions.pop(), company_id: company_4.id)
end

4.times do
  Opening.create(title: titles.pop(), description: descriptions.pop(), company_id: company_5.id)
end

### Applications ###

applicants = [
  applicant_1,
  applicant_2,
  applicant_3,
  applicant_4,
  applicant_5,
  applicant_6,
  applicant_7,
  applicant_8,
  applicant_9,
  applicant_10,
  applicant_11,
  applicant_12,
  applicant_13,
  applicant_14,
  applicant_15,
  applicant_16,
  applicant_17,
  applicant_18,
  applicant_19,
  applicant_20
]

openings = Opening.all

applicants.each_with_index do | applicant, index |
  Application.create(applicant_id: applicant.id, opening_id: openings[index].id)
  Application.create(applicant_id: applicant.id, opening_id: openings[(index + 3) % 20].id)
  Application.create(applicant_id: applicant.id, opening_id: openings[(index + 7) % 20].id)
  Application.create(applicant_id: applicant.id, opening_id: openings[(index + 11) % 20].id)
  Application.create(applicant_id: applicant.id, opening_id: openings[(index + 15) % 20].id)
  Application.create(applicant_id: applicant.id, opening_id: openings[(index + 19) % 20].id)
end







