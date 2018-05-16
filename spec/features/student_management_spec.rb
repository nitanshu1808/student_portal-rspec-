require "rails_helper"

RSpec.feature "Student management", :type => :feature do
  scenario "Create a new student" do
    visit "/students/new"

    fill_in "Name",  							:with => "Nitanshu_kyle"
    fill_in "Email", 							:with => "nitanshu.nik@gmail.com"
    select 23, from: "student[age]"
    select "UCD", from: "student[college]"
    find(:css, "#student_doing_internship").set(true)
    fill_in "Internship Company Name", :with => "Wipro"
    click_button "Submit"

    expect(page).to have_text(I18n.t("controllers.student.record_created"))
  end
end
