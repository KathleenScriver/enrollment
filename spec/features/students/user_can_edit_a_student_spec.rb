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
end
