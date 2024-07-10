require "test_helper"

class SalaryDeductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_deduction = salary_deductions(:one)
  end

  test "should get index" do
    get salary_deductions_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_deduction_url
    assert_response :success
  end

  test "should create salary_deduction" do
    assert_difference("SalaryDeduction.count") do
      post salary_deductions_url, params: { salary_deduction: { hours_worked: @salary_deduction.hours_worked, lastname: @salary_deduction.lastname, name: @salary_deduction.name, pension_fee: @salary_deduction.pension_fee, staff_id: @salary_deduction.staff_id, tax_fee: @salary_deduction.tax_fee, total_days_worked: @salary_deduction.total_days_worked } }
    end

    assert_redirected_to salary_deduction_url(SalaryDeduction.last)
  end

  test "should show salary_deduction" do
    get salary_deduction_url(@salary_deduction)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_deduction_url(@salary_deduction)
    assert_response :success
  end

  test "should update salary_deduction" do
    patch salary_deduction_url(@salary_deduction), params: { salary_deduction: { hours_worked: @salary_deduction.hours_worked, lastname: @salary_deduction.lastname, name: @salary_deduction.name, pension_fee: @salary_deduction.pension_fee, staff_id: @salary_deduction.staff_id, tax_fee: @salary_deduction.tax_fee, total_days_worked: @salary_deduction.total_days_worked } }
    assert_redirected_to salary_deduction_url(@salary_deduction)
  end

  test "should destroy salary_deduction" do
    assert_difference("SalaryDeduction.count", -1) do
      delete salary_deduction_url(@salary_deduction)
    end

    assert_redirected_to salary_deductions_url
  end
end
