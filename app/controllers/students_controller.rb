class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  
  def index
    @students = Student.all
  end

  
  def show
  end
  
  def report
     @students = Student.all
  end

  def new
    @student = Student.new
  end

  def edit
  end


  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :klas, :qrcode)
    end
end
