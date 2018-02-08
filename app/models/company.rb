class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_average_interest_level
    jobs
    .group(:id)
    .average(:level_of_interest)
  end
end
