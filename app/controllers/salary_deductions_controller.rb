class SalaryDeductionsController < ApplicationController
  before_action :set_salary_deduction, only: %i[ show edit update destroy ]

  # GET /salary_deductions or /salary_deductions.json
  def index
    @salary_deductions = SalaryDeduction.all
  end

  # GET /salary_deductions/1 or /salary_deductions/1.json
 
   # app/controllers/salary_deductions_controller.rb

  # GET /salary_deductions/1 or /salary_deductions/1.json
  def show
    @salary_deduction = SalaryDeduction.find(params[:id])
    total_hours_pay = @salary_deduction.staff.total_hours
    tax = @salary_deduction.tax_fee
    pension = @salary_deduction.pension_fee
    
    calculator = SalaryDeductionCalculator.new(total_hours_pay, tax, pension)
    @total_pay_after_deductions = calculator.calculate_total_pay_after_deductions
    
    SalaryDeductionCalculator.calculate_total_pay(@salary_deduction)
  end


  # GET /salary_deductions/new
  def new
    @salary_deduction = SalaryDeduction.new
    if params[:staff_id].present?
      staff = Staff.find_by(staff_id: params[:staff_id])
      if staff
        @salary_deduction.staff_id = staff.staff_id
        @salary_deduction.name = staff.name
      end
    end
  end

  # GET /salary_deductions/1/edit
  def edit
        #  Fetch the @salary_deduction in the `set_salary_deduction` method
  end

# POST /salary_deductions or /salary_deductions.json
def create
  # Extract parameters for calculation
  total_days_worked = params[:salary_deduction][:total_days_worked].to_i
  hours_worked = params[:salary_deduction][:hrs_worked].to_i  # Adjusted key to match the form input
  tax_fee = params[:salary_deduction][:tax_fee].to_f
  pension_fee = params[:salary_deduction][:pension_fee].to_f

  # Calculate net pay using the calculator class method
  net_pay = SalaryDeductionCalculator.calculate_net_pay(total_days_worked, hours_worked, tax_fee, pension_fee)

  # Build SalaryDeduction object with calculated net pay
  @salary_deduction = SalaryDeduction.new(salary_deduction_params.merge(net_pay: net_pay))
  @staff = Staff.find_by(staff_id: params[:salary_deduction][:staff_id])

  if @staff
    @salary_deduction.staff = @staff

    # Ensure you have the calculate_total_pay method correctly defined
    SalaryDeductionCalculator.calculate_total_pay(@salary_deduction)

    respond_to do |format|
      if @salary_deduction.save
        format.html { redirect_to @salary_deduction, notice: "Salary deduction was successfully created." }
        format.json { render :show, status: :created, location: @salary_deduction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salary_deduction.errors, status: :unprocessable_entity }
      end
    end
  else
    @salary_deduction.errors.add(:staff_id, "is invalid")
    render :new, status: :unprocessable_entity
  end
end



# PATCH/PUT /salary_deductions/1 or /salary_deductions/1.json
def update
  respond_to do |format|
    if @salary_deduction.update(salary_deduction_params)
      format.html { redirect_to salary_deduction_url(@salary_deduction), notice: "Salary deduction was successfully updated." }
      format.json { render :show, status: :ok, location: @salary_deduction }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @salary_deduction.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /salary_deductions/1 or /salary_deductions/1.json
  def destroy
    @salary_deduction.destroy!

    respond_to do |format|
      format.html { redirect_to salary_deductions_url, notice: "Salary deduction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_deduction
      @salary_deduction = SalaryDeduction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salary_deduction_params
      params.require(:salary_deduction).permit(:staff_id, :total_days_worked, :hours_worked, :tax_fee, :pension_fee,:net_pay)
    end
    
def calculate_net_pay(salary_deduction)
  total_pay = (salary_deduction.total_days_worked * salary_deduction.hrs_worked) - salary_deduction.tax_fee - salary_deduction.pension_fee
  total_pay
end
  end
