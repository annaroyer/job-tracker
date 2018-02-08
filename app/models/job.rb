class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.attribute_alias
    {location: 'city', interest: 'level_of_interest'}
  end

  def self.sort(parameter)
    order(attribute_alias[parameter])
  end

  def self.by_interest_level
    order(:level_of_interest).group(:level_of_interest).count
  end

  def self.by_location
    group(:city).count
  end
end
