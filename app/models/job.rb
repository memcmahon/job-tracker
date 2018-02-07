class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments
  scope :sort_by_location, -> { order(:city) }

  def self.count_by_interest
    group(:level_of_interest).order(level_of_interest: :desc).count
  end
end
