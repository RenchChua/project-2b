class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
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
