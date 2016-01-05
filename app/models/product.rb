class Product < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100"}, format: { with: %r{\.(gif|jpg|jpeg|png)$}i}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}


end
