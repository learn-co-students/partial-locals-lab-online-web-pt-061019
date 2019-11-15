# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # def self.search(query)
  #   # @students = Student.where("name LIKE (?)", "%#{params["query"]}%")
  #   #
  #   # if @students.empty?
  #   #   # show all students
  #   #   @students = Students.all
  #   # end
  #
  #   if query.present?
  #     # @students = Student.where("name LIKE (?)", "%#{"query"}%")
  #     # where('NAME like ?', "%#{query}%")
  #     where("name LIKE ?", "%query%")
  #   else
  #     self.all
  #   end
  # end

  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      self.all
    end
  end

end
