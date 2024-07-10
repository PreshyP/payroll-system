class StaffsController < ApplicationController
  before_action :set_staff, only: %i[ show edit update destroy ]

  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
    @deductions = SalaryDeductionCalculator.calculate(@staff.salary, 8, 25, 5) # Assuming 8 hours/day, 25% tax, 5% pension
    @staff = Staff.find(params[:id])
    @salary_deduction = @staff.salary_deductions.build  # Builds a new salary deduction associated with the staff
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to staff_url(@staff), notice: "Staff was successfully created." }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staff_url(@staff), notice: "Staff was successfully updated." }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy!

    respond_to do |format|
      format.html { redirect_to staffs_url, notice: "Staff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:staff_id, :name, :lastname, :job_title, :total_hours, :total_days_worked, :salary)
      params.require(:salary_deduction).permit(:staff_id, :total_days_worked, :hours_worked, :tax_fee, :pension_fee)
    end
end
