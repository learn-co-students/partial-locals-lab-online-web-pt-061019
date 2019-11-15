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
    @students = Student.search(params[:query])
    render 'index'

    # @students = Student.all
    # raise params
    # {"query"=>"Shannon"}
    # @students = Student.where("name LIKE (?)", "%#{params["query"]}%")

    # User.where("first_name LIKE (?)", "%#{first_name}%")


    # ActiveRecord that follows the form:
    # Student.where("name LIKE ?", "%M%").
    # You should be able to visually test this by visiting
    # http://localhost:3000?query="search_text".
    # Doing so will mean that you will have a query
    # parameter whose data can be fit into a LIKE query.
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
