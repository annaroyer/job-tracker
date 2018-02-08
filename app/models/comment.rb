class Comment < ApplicationRecord
  validates_presence_of :content, :job
  belongs_to :job
end
