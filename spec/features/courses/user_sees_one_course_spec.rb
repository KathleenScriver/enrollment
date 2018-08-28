require "rails_helper"

describe "When I visit /courses/:id" do
  it "should show all students in course" do
    course = Course.create(name: "Mod 2")
    student_1 = course.students.create(name: "Kat Scriver")
    student_2 = course.students.create(name: "Jesse Ling")
    student_3 = course.students.create(name: "Harper Bellows")

    visit course_path(course)

    expect(page).to have_content(course.name)
    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_3.name)

    within('#course-count') do
      expect(page).to have_content(course.students.count)
    end
  end
end
