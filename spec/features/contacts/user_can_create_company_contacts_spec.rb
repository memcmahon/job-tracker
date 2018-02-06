require 'rails_helper'

describe "user can create company contacts" do
  describe "they visit company show page" do
    it "they can create a contact" do
      company = Company.create!(name: "ESPN")
      visit company_path(company)

      expect(page).to have_content("Company Contacts:")
      expect(page).to have_content("New Contact:")

      fill_in("contact[full_name]", with: "Bruce Banner")
      fill_in("contact[position]", with: "The Hulk")
      fill_in("contact[email]", with: "jollygreengiant@marvel.com")
      click_on("Create Contact")
    end
  end
end
