require "rails_helper"

describe "As a user" do
  describe "visit student index page" do
    it 'should delete a student' do
      student_1 = Student.create!(name: "Kat Scriver")
      student_2 = Student.create!(name: "Kathleen Yruegas")
      student_3 = Student.create!(name: "Jesse Ling")

      visit students_path

      within("#student-#{student_2.id}") do
        click_on("Delete")
      end

      expect(page).to_not have_content(student_2.name)
      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_3.name)
    end
  end
end
