class Comment < ApplicationRecord
	belongs_to :user
	belongs_to	:manual

	validates :body, presence: true
	after_create_commit { RenderCommentJob.perform_later self}
end
