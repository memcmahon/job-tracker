require 'rails_helper'

describe "user sees a list of all categories" do
  describe "they visit category index" do
    it "they see all categories" do
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.create!(title: "Finance")
      category_3 = Category.create!(title: "Education")
      visit categories_path

      expect(page).to have_content("All Categories")
      expect(page).to have_content("Web Development")
      expect(page).to have_content("Finance")
      expect(page).to have_content("Education")
    end

    it "it has links to edit each category" do
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.create!(title: "Finance")
      category_3 = Category.create!(title: "Education")
      visit categories_path

      expect(page).to have_content("Click on Category Name to Edit")
      expect(page).to have_link("Edit Web Development")
      expect(page).to have_link("Edit Finance")
      expect(page).to have_link("Edit Education")

      click_on "Edit Education"
      expect(current_path).to eq(edit_category_path(category_3))
    end

    it "it has links to delete each category" do
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.create!(title: "Finance")
      category_3 = Category.create!(title: "Education")
      visit categories_path

      expect(page).to have_link("Delete")

      click_on "Delete", match: :first
      expect(page).to have_content("Finance")
      expect(page).to have_content("Education")
      expect(page).to_not have_link("Web Development")
      expect(Category.count).to eq(2)
    end
  end
end
