# User.create(first_name: "Yulia", last_name: "Kobov", email: "yulia@example.com", password: "password", password_confirmation: "password", home_currency: "UAH")
# User.create(first_name: "Dave", last_name: "Steeves", email: "dave@example.com", password: "password", password_confirmation: "password", home_currency: "USD")
# User.create(first_name: "Ann", last_name: "Gav", email: "ann@example.com", password: "password", password_confirmation: "password", home_currency: "GBP")
# User.create(first_name: "Paul", last_name: "Losso", email: "paul@example.com", password: "password", password_confirmation: "password", home_currency: "EUR")

require "csv"

csv_text = File.read(Rails.root.join("lib", "seeds", "currency-list.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  c = Currency.new
  c.entity = row["Entity"]
  c.currency = row["Currency"]
  c.alphabetic_code = row["AlphabeticCode"]
  c.save
  puts "#{c.entity}: #{c.currency} and #{c.alphabetic_code} saved"
end

puts "There are now #{Currency.count} rows in the Currency model"
