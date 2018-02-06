class Comment < ApplicationRecord
  validates_presence_of :subject

  belongs_to :job
end
