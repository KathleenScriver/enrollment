require "rails_helper"

describe "As a user" do
  describe "visit student show page" do
    it 'should see one student with name' do
      student = Student.create!(name: "Kat Scriver")

      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end
