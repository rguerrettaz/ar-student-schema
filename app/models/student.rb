require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i }
  validates :email, :uniqueness => true
  validate  :age_is_greater_than_5
  validates :phone, :format => { :with => /^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$/ }
  
  def name
    first_name + ' ' + last_name
  end

  def age_is_greater_than_5
    if age < 5
      errors.add(:birthday, "must be older than 5")
    end
  end

  def age
    today = Date.today
    age = today.year - birthday.year - ((today.month > birthday.month || (today.month == birthday.month && today.day >= birthday.day)) ? 0 : 1)
  end

end



