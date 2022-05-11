class Income < ApplicationRecord
  belongs_to :user

  scope :with_user, ->(user_id) {where('user_id = ?', user_id)}
  scope :with_predefined, ->{where(predefined: true)}
  
end
