require 'rails_helper'

describe "user can edit a category" do
  describe "user visits category edit" do
    it "they can edit a category" do
      category = Category.create!(title: "Web Development")
      visit edit_category_path(category)

      fill_in("category[title]", with: "Software Development")
      click_on("Update Category")

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Software Development")
      expect(page).to_not have_content("Web Development")
    end
  end
end
