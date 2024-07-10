class SalaryDeduction < ApplicationRecord
    belongs_to :staff

  
    validates :staff_id, presence: true
    validates :total_days_worked, presence: true
  end
  
  # app/models/staff.rb
  class Staff < ApplicationRecord
    has_many :salary_deductions
    attr_accessor :net_pay
  end