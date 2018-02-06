require 'rails_helper'

describe "users can create categories" do
  describe "user visits category index" do
    it "links to new category page" do
      visit categories_path

      click_on "Create New Category"

      expect(page).to have_content("Create a new category here!")
    end
  end

  describe "user visits category new page" do
    it "creates a new category" do
      visit new_category_path

      fill_in "category[title]", with: "Healthcare"
      click_on "Create Category"

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Healthcare")
    end
  end

  describe "user can not create category with non-unique name" do
    it "user is sent back to new category form" do
      category = Category.create!(title: "Web Development")
      visit new_category_path

      fill_in "category[title]", with: "Web Development"
      click_on "Create Category"

      expect(current_path).to eq(new_category_path)
      expect(page).to have_content("Create a new category here!")
    end
  end
end
