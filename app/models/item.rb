class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_one_attached :image

  def get_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/nagano_cake/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/png')
    end
    image.variant(resize: size).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
