require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        company = Company.create!(name: "Turing")
        contact = company.contacts.new(position: "The Hulk",
                                      email: "jollygreengiant@marvel.com")

        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        company = Company.create!(name: "Turing")
        contact = company.contacts.new(full_name: "Bruce Banner",
                                      email: "jollygreengiant@marvel.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        company = Company.create!(name: "Turing")
        contact = company.contacts.new(full_name: "Bruce Banner",
                                      position: "The Hulk")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a full name, position, and email" do
        company = Company.create!(name: "Turing")
        contact = company.contacts.new(full_name: "Bruce Banner",
                                      position: "The Hulk",
                                      email: "jollygreengiant@marvel.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.create!(name: "Turing")
      contact = company.contacts.new(full_name: "Bruce Banner",
                                    position: "The Hulk",
                                    email: "jollygreengiant@marvel.com")
      expect(contact).to respond_to(:company)
    end
  end
end
