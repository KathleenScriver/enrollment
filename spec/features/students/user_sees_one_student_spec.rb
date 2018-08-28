require "rails_helper"

describe "As a user" do
  describe "visit student show page" do
    it 'should see one student with name' do
      student = Student.create!(name: "Kat Scriver")

      visit student_path(student)

      expect(page).to have_content(student.name)

      click_link("Back to All Students")
      expect(current_path).to eq(students_path)
    end
  end
end
