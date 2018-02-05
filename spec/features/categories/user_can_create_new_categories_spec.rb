require 'rails_helper'

describe "users can create categories" do
  describe "user visits category index" do
    it "links to new category page" do
      visit categories_path

      click_on "Create New Category"

      expect(page).to have_content("New Category")
    end
  end
end
