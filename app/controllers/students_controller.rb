class StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: I18n.t("controllers.student.record_created")
    else
      render 'new'
    end
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def all_students
    @students = Student.all
    render json: @students 
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :age, :college, :doing_internship, :internship_company)
  end
end
