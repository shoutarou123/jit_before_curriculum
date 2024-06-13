class Article < ApplicationRecord
  belongs_to :user

  validates :title,
end
