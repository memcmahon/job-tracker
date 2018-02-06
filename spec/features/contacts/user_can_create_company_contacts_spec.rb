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

    it "they can create multiple contacts" do
      company = Company.create!(name: "ESPN")
      visit company_path(company)

      expect(page).to have_content("Company Contacts:")
      expect(page).to have_content("New Contact:")

      fill_in("contact[full_name]", with: "Bruce Banner")
      fill_in("contact[position]", with: "The Hulk")
      fill_in("contact[email]", with: "jollygreengiant@marvel.com")
      click_on("Create Contact")

      fill_in("contact[full_name]", with: "Pepper Potts")
      fill_in("contact[position]", with: "Super Assistant")
      fill_in("contact[email]", with: "getitdone@marvel.com")
      click_on("Create Contact")

      expect(page).to have_content("Pepper Potts")
      expect(page).to have_content("Bruce Banner")
    end
  end
end
