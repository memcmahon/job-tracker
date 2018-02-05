require 'rails_helper'

describe "User edits an existing job" do
  describe "user visits job show page" do
    it "they can edit job attributes" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer",
                                 description: "So fun!",
                                 level_of_interest: 80,
                                 city: "Denver")

      visit company_job_path(company, job)

      click_on "Edit"

      fill_in "job[title]", with: "Junior Developer"
      fill_in "job[description]", with: "So much fun!"
      fill_in "job[level_of_interest]", with: 90
      fill_in "job[city]", with: "Chicago"
      click_on "Update Job"

      expect(page).to have_content "Junior Developer"
    end
  end
end
