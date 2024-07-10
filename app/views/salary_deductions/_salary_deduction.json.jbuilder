json.extract! salary_deduction, :id, :staff_id, :name, :lastname, :total_days_worked, :hours_worked, :tax_fee, :pension_fee, :created_at, :updated_at
json.url salary_deduction_url(salary_deduction, format: :json)
