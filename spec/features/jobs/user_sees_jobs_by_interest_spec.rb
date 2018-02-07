require 'rails_helper'

describe "user sees jobs by interest level" do
  describe "they visit /jobs?sort=interest" do
    it "shows jobs sorted by interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Senior Developer", description: "So fun!", level_of_interest: 60, city: "Denver", category_id: category.id)
      job_1 = company.jobs.create!(title: "Accountant", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_1 = company.jobs.create!(title: "Announcer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)

      visit "/jobs?sort=interest"

      expect(page).to have_content("Denver: Announcer at ESPN, 90 Denver: Accountant at ESPN, 80")
    end
  end
end
