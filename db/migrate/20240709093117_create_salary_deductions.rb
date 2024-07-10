class CreateSalaryDeductions < ActiveRecord::Migration[7.1]
  def change
    create_table :salary_deductions do |t|
      t.integer :staff_id
      t.string :name
      t.string :lastname
      t.integer :total_days_worked
      t.integer :hours_worked
      t.decimal :tax_fee
      t.decimal :pension_fee

      t.timestamps
    end
  end
end
