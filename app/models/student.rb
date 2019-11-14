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

  def self.search(query)
    # Student.where("name LIKE ?", "%M%")
# it should actually be something like the above but can't figure it out.

    matched_students = []
    if query == ""
      Student.all
    else
      # binding.pry
      Student.all.each do |s|
        if s.name.downcase.include?(query)
          matched_students << s
        end
      end
      matched_students
    end
  end
end
