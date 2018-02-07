require 'rails_helper'

describe "user sees application dashboard" do
  describe "they visit /dashboard" do
    it "they see jobs by level of interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_1 = company.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 90, city: "Denver", category_id: category.id)
      job_1 = company.jobs.create!(title: "Anouncer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_1 = company.jobs.create!(title: "Janitor", description: "So fun!", level_of_interest: 90, city: "Denver", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("Jobs by Interest Level:")
      expect(page).to have_content("80: Developer, Anouncer")
      expect(page).to have_content("90: Junior Developer, Janitor")
    end
  end
end
