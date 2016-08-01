class Wibni < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, :summary, :description, :picture, presence: true
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  default_scope -> { order(created_at: :desc) }

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
