class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true
  has_one_attached :image
  before_destroy :purge_image

  private

  def purge_image
    image.purge
  end
end
