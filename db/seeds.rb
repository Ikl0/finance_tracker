# frozen_string_literal: true

User.create!(email: 'user@example.com', password: '123456', password_confirmation: '123456')
p "Created #{User.count} users"
expenses_list = [
  'Groceries',
  'Medicines',
  'Clothing',
  'Transport',
  'Housing payment',
  'HU',
  'Taxes',
  'Cafes',
  'Phone',
  'Loan'
]
expenses_list.each do |name|
  Expence.create(name:,
                 description: name,
                 user_id: 1,
                 predefined: true)
end

p "Created #{Expence.count} expenses"

incomes_list = [
  'Salary',
  'Investments',
  'Pensions',
  'Cashback',
  'Gifts',
  'Deposits',
  'Crypto',
  'Self-employed',
  'Real Estate',
  'Sales'
]
incomes_list.each do |name|
  Income.create(name:,
                description: name,
                user_id: 1,
                predefined: true)
end
p "Created #{Income.count} incomes"

AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')
p "Created #{AdminUser.count} admins"
