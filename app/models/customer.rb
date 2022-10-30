class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :cart_items
  has_many :orders

  def active_for_authentication?
    super && (is_deleted == false)
  end

  #enum is_deleted: { 有効: 0, 無効: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
