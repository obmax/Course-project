require 'elasticsearch/model'

class Manual < ApplicationRecord
	acts_as_votable
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks


	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	has_many :steps, dependent: :destroy
	accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

	has_many :comments, dependent: :destroy
	belongs_to :category
	belongs_to :user

	has_attached_file :image, styles: { small: "64x64", thumb: "200x200", large: "650x650" }
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	validates :title, presence: true
	validates :summary, presence: true
	validates :body, presence: true

	def all_tags
		self.tags.map(&:name).join(' #')
	end

	def all_tags=(names)
		self.tags = names.split('#').map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end


	def self.search(query)
	  __elasticsearch__.search(
	    {
	      query: {
	        multi_match: {
	          query: query,
	          fields: ['title','summary', 'body']
	        }
	      },
	      highlight: {
	        pre_tags: ['<em>'],
	        post_tags: ['</em>'],
	        fields: {
	          title: {},
	          text: {}
	        }
	      }
	    }
	  )
	end
end