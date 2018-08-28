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

      click_link("Return to All Students")
      expect(current_path).to eq(students_path)

      visit student_path(student)

      click_on("Create New Student")
      expect(current_path).to eq(new_student_path)
    end

    it 'should show all addresses' do
      student = Student.create!(name: "Kat Scriver")
      address_1 = student.addresses.create(description: "Home", street_address: "123 Main", city: "Denver", state: "CO", zip_code: "80020")
      address_2 = student.addresses.create(description: "Other", street_address: "774 Turtle St", city: "Denver", state: "CO", zip_code: "80025")

      visit student_path(student)

      expect(page).to have_content(address_1.description)
      expect(page).to have_content(address_2.description)
      expect(page).to have_content(address_1.street_address)
      expect(page).to have_content(address_2.street_address)
    end

    it 'should list all courses for student' do
      student = Student.create!(name: "Kat Scriver")
      course_1 = student.courses.create(name: "Mod 1")
      course_2 = student.courses.create(name: "Mod 2")

      visit student_path(student)

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
    end
  end
end
