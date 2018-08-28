require "rails_helper"

describe "As a user" do
  describe "when I visit student index page" do
    it 'should show all students' do
      student_1 = Student.create!(name: "Kat Scriver")
      student_2 = Student.create!(name: "Jesse Ling")
      student_3 = Student.create!(name: "Harper Bellows")

      visit students_path

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_3.name)

    end
  end
end
