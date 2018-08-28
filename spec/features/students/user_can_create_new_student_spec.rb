require "rails_helper"

describe "As a user" do
  describe "I visit student index page" do
    it "should be able to create new student" do

      student_name = "Kathleen Scriver"
      
      visit students_path
      click_link("Create New Student")

      expect(current_path).to eq(new_student_path)

      fill_in :student_name, with: student_name
      click_on("Create Student")

      expect(current_path).to eq(student_path(Student.last))
      expect(page).to have_content(student_name)
    end
  end
end
