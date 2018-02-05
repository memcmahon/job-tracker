require 'rails_helper'

describe "User edits an existing job" do
  describe "user visits company job index" do
    it "has edit button for each job" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer",
                                 description: "So fun!",
                                 level_of_interest: 80,
                                 city: "Denver")

      visit company_jobs_path(company)

      click_on "Edit Developer"

      expect(current_path).to eq edit_company_job_path(company, job)
    end

    it "they can edit job attributes" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer",
                                 description: "So fun!",
                                 level_of_interest: 80,
                                 city: "Denver")

      visit company_jobs_path(company)

      click_on "Edit Developer"

      fill_in "job[title]", with: "Junior Developer"
      fill_in "job[description]", with: "So much fun!"
      fill_in "job[level_of_interest]", with: 90
      fill_in "job[city]", with: "Chicago"
      click_on "Update Job"

      expect(page).to have_content "Junior Developer"
    end
  end
end
