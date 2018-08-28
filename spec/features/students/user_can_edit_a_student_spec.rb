require "rails_helper"

describe "As a user" do
  describe "when I visit a student show page" do
    it "should edit a student" do
      prior_name = "Kat Yruegas"
      student = Student.create!(name: prior_name)

      visit student_path(student)
      click_on("Edit")

      new_name = "Kathleen Scriver"
      fill_in :student_name, with: new_name
      click_on("Update Student")

      expect(current_path).to eq(student_path(student))
      expect(page).to_not have_content(prior_name)
      expect(page).to have_content(new_name)
    end
  end

  describe "from the edit page" do
    it 'should have links to create new and see all students' do
      student = Student.create!(name: "Kat Scriver")

      visit edit_student_path(student)

      click_on("Return to All Students")
      expect(current_path).to eq(students_path)

      visit edit_student_path(student)

      click_on("Create New Student")
      expect(current_path).to eq(new_student_path)
    end
  end
end
