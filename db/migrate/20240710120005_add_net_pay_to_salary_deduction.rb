class AddNetPayToSalaryDeduction < ActiveRecord::Migration[7.1]
  def change
    add_column :salary_deductions, :net_pay, :decimal
  end
end
