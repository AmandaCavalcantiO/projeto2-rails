class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, :description, :price, :category_id, :user_id, :presence => true

  has_attached_file :image, styles: { medium: "300x300", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
