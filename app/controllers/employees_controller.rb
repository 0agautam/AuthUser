class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @q = params[:search_query]
    @departments = Department.all
    if @q.present? ? @q : nil
      #Employee.where("name ilike ?","%#{search}%")
      puts "Your search is #{@q}"
      @employees = Employee.search @q, fields: ["department_name","name"], match: :word_start
    else
      @employees = Employee.all
    end
  end

  # def autocomplete
  #   render json: Employee.search(params[:search_query], {
  #     fields: ["name^5"],
  #     match: :word_start,
  #     limit: 10,
  #     load: false,
  #     misspellings: {below: 5}
  #   }).map(&:name)
  # end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @departments = Department.all
    @departments.each do |dep|
      puts "Department id is #{dep.name}"
    end
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :email, :address, :doj, :department_id)
    end
end
