require "rails_helper"

describe "When I visit /students/:id/addresses/new" do
  it "should create a new address" do
    student = Student.create(name: "Kat Scriver")

    visit new_student_address_path(student)

    fill_in :address_description, with: "Permanent Address"
    fill_in :address_street_address, with: "123 Main St"
    fill_in :address_city, with: "Denver"
    fill_in :address_state, with: "CO"
    fill_in :address_zip_code, with: "80020"
    click_on("Create Address")

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("Permanent Address")
    expect(page).to have_content("123 Main St\nDenver, CO 80020")
  end
end
