class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, :description, :price, :image_name,
  :category,  :presence => true
end
