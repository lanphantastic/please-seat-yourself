class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader

  PRICE_RANGES = {
    '15 - 30' => '$15 to $30',
    '30 - 60' => '$30 to $60',
    '60 - 90' => '$60 to $90'
  }
end
