class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  before_destroy :purge_image

  private

  def purge_image
    image.purge
  end
end
