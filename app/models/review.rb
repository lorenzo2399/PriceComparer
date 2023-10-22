class Review < ApplicationRecord
	belongs_to :user
	validates :comment, presence: true
	validates :rating, presence: true
	validates :title, presence: true 
	validates :item_id, presence: true
	validates :negozio, presence: true
end
