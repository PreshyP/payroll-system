class CreateStaffs < ActiveRecord::Migration[7.1]
  def change
    create_table :staffs do |t|
      t.integer :staff_id
      t.string :name
      t.string :lastname
      t.string :job_title
      t.integer :total_hours
      t.integer :total_days_worked
      t.decimal :salary

      t.timestamps
    end
  end
end
