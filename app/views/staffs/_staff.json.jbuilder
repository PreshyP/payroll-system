json.extract! staff, :id, :staff_id, :name, :lastname, :job_title, :total_hours, :total_days_worked, :salary, :created_at, :updated_at
json.url staff_url(staff, format: :json)
