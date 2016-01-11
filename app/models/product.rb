class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100"}, format: { with: %r{\.(gif|jpg|jpeg|png)$}i}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}

	private 

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			error.add(:base, 'Line items present')
			return false
		end
	end

end
