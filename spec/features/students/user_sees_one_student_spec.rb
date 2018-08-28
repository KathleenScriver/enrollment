require "rails_helper"

describe "As a user" do
  describe "visit student show page" do
    it 'should see one student with name' do
      student = Student.create!(name: "Kat Scriver")

      visit student_path(student)

      expect(page).to have_content(student.name)
    end

    it 'should have links to create new and see all students' do
      student = Student.create!(name: "Kat Scriver")

      visit student_path(student)

      click_on("Return to All Students")
      expect(current_path).to eq(students_path)

      visit student_path

      click_on("Create New Student")
      expect(current_path).to eq(new_student_path)
    end
  end
end
