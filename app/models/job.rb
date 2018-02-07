class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.attributes
    {location: 'city', interest: 'level_of_interest'}
  end

  def self.sort(parameter)
    order(attributes[parameter])
  end
end
