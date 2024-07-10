require "application_system_test_case"

class SalaryDeductionsTest < ApplicationSystemTestCase
  setup do
    @salary_deduction = salary_deductions(:one)
  end

  test "visiting the index" do
    visit salary_deductions_url
    assert_selector "h1", text: "Salary deductions"
  end

  test "should create salary deduction" do
    visit salary_deductions_url
    click_on "New salary deduction"

    fill_in "Hours worked", with: @salary_deduction.hours_worked
    fill_in "Lastname", with: @salary_deduction.lastname
    fill_in "Name", with: @salary_deduction.name
    fill_in "Pension fee", with: @salary_deduction.pension_fee
    fill_in "Staff", with: @salary_deduction.staff_id
    fill_in "Tax fee", with: @salary_deduction.tax_fee
    fill_in "Total days worked", with: @salary_deduction.total_days_worked
    click_on "Create Salary deduction"

    assert_text "Salary deduction was successfully created"
    click_on "Back"
  end

  test "should update Salary deduction" do
    visit salary_deduction_url(@salary_deduction)
    click_on "Edit this salary deduction", match: :first

    fill_in "Hours worked", with: @salary_deduction.hours_worked
    fill_in "Lastname", with: @salary_deduction.lastname
    fill_in "Name", with: @salary_deduction.name
    fill_in "Pension fee", with: @salary_deduction.pension_fee
    fill_in "Staff", with: @salary_deduction.staff_id
    fill_in "Tax fee", with: @salary_deduction.tax_fee
    fill_in "Total days worked", with: @salary_deduction.total_days_worked
    click_on "Update Salary deduction"

    assert_text "Salary deduction was successfully updated"
    click_on "Back"
  end

  test "should destroy Salary deduction" do
    visit salary_deduction_url(@salary_deduction)
    click_on "Destroy this salary deduction", match: :first

    assert_text "Salary deduction was successfully destroyed"
  end
end
