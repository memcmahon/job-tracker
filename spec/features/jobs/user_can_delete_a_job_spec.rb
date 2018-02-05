require 'rails_helper'

describe "user can delete a job" do
  describe "they visit the job page" do
    it "they can delete that job" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer",
                                 description: "So fun!",
                                 level_of_interest: 80,
                                 city: "Denver")

      visit company_job_path(company, job)

      click_on "Delete"

      expect(page).to_not have_content("Developer")
      expect(page).to have_content("All Jobs for ESPN")
    end
  end
end
