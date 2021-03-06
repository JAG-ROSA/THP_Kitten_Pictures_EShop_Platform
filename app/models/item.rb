class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :category_items
  has_many :categories, through: :category_items

  validates :title, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { in: 20..500 }
  validates :price, presence: true
  validates_inclusion_of :price, in: 0..1000

  #item has one picture file
  has_one_attached :image

  def category_classes
    return self.categories.pluck(:id).map{|el| el.to_s.prepend("group-")}.join(" ")
  end
end
