require 'rails_helper'

describe Comment do
  describe "Validations" do
    it "is invalid without a subject" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment_1 = job.comments.new()
      comment_2 = job.comments.new(subject: "This is a comment")

      expect(comment_1).to be_invalid
      expect(comment_2).to be_valid
    end

    it "is created with timestamps" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment = job.comments.create!(subject: "This is a comment")

      expect(comment.created_at).to_not be_nil
      expect(comment.updated_at).to_not be_nil
    end
  end

  describe "Relationships" do
    it "belongs_to" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Entertainment")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment = job.comments.new(subject: "This is a comment")

      expect(comment).to respond_to(:job)
    end
  end
end
