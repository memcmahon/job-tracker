require 'rails_helper'

describe "User sees a single category" do
  describe "they visit the category index" do
    it "has links to category show page" do
      company = Company.create!(name: "ESPN")
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.create!(title: "Entertainment")

      visit categories_path

      expect(page).to have_link("Web Development")
      expect(page).to have_link("Entertainment")

      click_on("Web Development")

      expect(current_path).to eq(category_path(category_1))
    end
  end

  describe "they visit the category show page" do
    it "has a list of all category jobs" do
      company = Company.create!(name: "ESPN")
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.create!(title: "Entertainment")
      job_1 = company.jobs.create!(title: "Anouncer", level_of_interest: 70, city: "Denver", category: category_2)
      job_2 = company.jobs.create!(title: "Junior Developer", level_of_interest: 70, city: "Denver", category: category_1)
      job_3 = company.jobs.create!(title: "Senior Developer", level_of_interest: 70, city: "Denver", category: category_1)

      visit category_path(category_1)

      expect(page).to have_content("Junior Developer")
      expect(page).to have_content("Senior Developer")
      expect(page).to_not have_content("Announcer")
    end
  end
end
