require 'rails_helper'

describe Category do
  describe "Validations" do
    it "is invalid without a title" do
      category = Category.new()

      expect(category).to be_invalid
    end

    it "is invalid without a unique title" do
      category_1 = Category.create!(title: "Web Development")
      category_2 = Category.new(title: "Web Development")

      expect(category_1).to be_valid
      expect(category_2).to be_invalid
    end
  end

  describe "Relationships" do
    it "has_many jobs" do
      category_1 = Category.create!(title: "Web Development")

      expect(category_1).to respond_to(:jobs)
    end
  end
end
