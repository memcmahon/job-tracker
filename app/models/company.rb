class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_by_average_level
    select("companies.*, avg(level_of_interest) AS average_level_of_interest")
          .joins(:jobs)
          .group(:id)
          .order("average_level_of_interest").last(3)
  end
end
