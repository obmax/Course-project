class Category < ApplicationRecord
	has_many :manuals
	validates :name, presence: true
end
