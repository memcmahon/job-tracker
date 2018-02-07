require 'rails_helper'

describe "user sees application dashboard" do
  describe "they visit /dashboard" do
    it "they see jobs by level of interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 90, city: "Denver", category_id: category.id)
      job_3 = company.jobs.create!(title: "Anouncer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("Count of Jobs by Interest Level")
      expect(page).to have_content("80: 2")
      expect(page).to have_content("90: 1")
    end

    it "they see top three companies by interest level" do
      company_1 = Company.create!(name: "ESPN")
      company_2 = Company.create!(name: "ABC")
      company_3 = Company.create!(name: "MTV")
      company_4 = Company.create!(name: "DISNEY")
      category = Category.create!(title: "Entertainment")
      job_1 = company_4.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_2 = company_4.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 90, city: "Denver", category_id: category.id)
      job_3 = company_3.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_4 = company_3.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_5 = company_2.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 60, city: "Denver", category_id: category.id)
      job_6 = company_2.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_7= company_1.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 50, city: "Denver", category_id: category.id)
      job_8 = company_1.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 60, city: "Denver", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("Top Companies by Average Score:")
      expect(page).to have_content("DISNEY")
      expect(page).to have_content("MTV")
      expect(page).to have_content("ABC")
      expect(page).to_not have_content("ESPN")
    end

    it "they see a count of jobs by location" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 90, city: "Denver", category_id: category.id)
      job_3 = company.jobs.create!(title: "Anouncer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_4 = company.jobs.create!(title: "Anouncer", description: "So fun!", level_of_interest: 80, city: "Austin", category_id: category.id)
      job_5 = company.jobs.create!(title: "Anouncer", description: "So fun!", level_of_interest: 80, city: "Austin", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("Job Count by Location:")
      expect(page).to have_content("Denver: 3")
      expect(page).to have_content("Austin: 2")
    end

    it "has links to location job index" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Senior Developer", description: "So fun!", level_of_interest: 80, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "Junior Developer", description: "So fun!", level_of_interest: 80, city: "Austin", category_id: category.id)

      visit dashboard_path

      click_on("Denver")

      expect(page).to have_content("Senior Developer")
      expect(page).to_not have_content("Junior Developer")
    end
  end
end
