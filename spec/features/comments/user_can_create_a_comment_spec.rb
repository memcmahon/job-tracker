require 'rails_helper'

describe "user can create comments" do
  describe "they visit the job show page" do
    it "they can create a comment" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit job_path(job)

      expect(page).to have_content("Comments:")
      fill_in("comment[subject]", with: "Call hiring manager next week")
      click_on("Create Comment")

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Call hiring manager next week")
      expect(page).to have_content("Created At: ")
    end

    it "they can create multiple comments" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit job_path(job)

      expect(page).to have_content("Comments:")
      fill_in("comment[subject]", with: "Call hiring manager next week")
      click_on("Create Comment")

      fill_in("comment[subject]", with: "This is another Comment")
      click_on("Create Comment")
    end
  end
end
