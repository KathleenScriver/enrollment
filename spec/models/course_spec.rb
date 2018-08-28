require "rails_helper"

describe Course, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:student_courses)}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    it '#student_count' do
      course = Course.create(name: "Mod 2")
      student_1 = course.students.create(name: "Kat Scriver")
      student_2 = course.students.create(name: "Jesse Ling")
      student_3 = course.students.create(name: "Harper Bellows")

      expect(course.student_count).to eq(3)
    end
  end
end
