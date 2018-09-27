class Step < ApplicationRecord
	belongs_to :manual, optional: true
	belongs_to :user

	has_attached_file :image, styles: {thumb: "400x400", large: "650x650"}
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates :title, presence: true    
    validates :body, presence: true

    def self.search(query)
	  __elasticsearch__.search(
	    {
	      query: {
	        multi_match: {
	          query: query,
	          fields: ['title', 'body']
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
