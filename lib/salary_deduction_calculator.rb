# lib/salary_deduction_calculator.rb

class SalaryDeductionCalculator
  def self.instance
    @instance ||= new
  end

  def calculate_net_pay(total_days_worked, hours_worked, tax_fee, pension_fee)
    net_pay = (total_days_worked * hours_worked) - tax_fee - pension_fee
    return net_pay
  end
end



  
  