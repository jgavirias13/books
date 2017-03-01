class Libro < ApplicationRecord
  resourcify
  has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "images/:style/default_libro.png"
  validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :imagen, less_than: 2.megabytes
  validates :imagen, presence: true
  belongs_to :user
end
