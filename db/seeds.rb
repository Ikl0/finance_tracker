# frozen_string_literal: true

User.create!(email: 'user@example.com', password: '12345678', password_confirmation: '12345678')
p "Created #{User.count} users"
expenses_list = [
  'food',
  'transport',
  'closes',
  'mobile phone',
  'technic',
  'presents',
  'cosmetic',
  'public services'
]
Expence.destroy_all
expenses_list.each do |name|
  Expence.create(name: name,
                 description: name,
                 user_id: 1,
                 predefined: true)
end

p "Created #{Expence.count} expences"

incomes_list = %w[
  salary
  cashback
  gifts
  dividents
]
Income.destroy_all
incomes_list.each do |name|
  Income.create(name: name,
                description: name,
                user_id: 1,
                predefined: true)
end
p "Created #{Income.count} incomes"

AdminUser.create!(email: 'admin@example.com', password: '12345678', password_confirmation: '12345678')
p "Created #{AdminUser.count} admins"
