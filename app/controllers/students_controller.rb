class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    # @students = Student.all
    @students = Student.search(params[:query])
    #search method in student model to pass this:
    # Add in search functionality such that users can type in a student name or fragment of a student name and and see all matching results on the students index page.
  end

  # def search
  #   binding.pry
  # end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
