class Research < ApplicationRecord
belongs_to :user
validates :title, presence: true 
validates :price, presence: true
validates :location, presence: true
validates :item_id, presence: true
validates :url, presence: true
validates :feed, presence: true
validates :time, presence: true
end
