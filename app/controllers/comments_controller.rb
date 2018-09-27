class CommentsController < ApplicationController
	before_action :set_manual

	def create
		@comment = @manual.comments.new(comment_params)
		@comment.user = current_user
		@comment.save

		respond_to do |format|
			format.html {redirect_to @manual}
			format.js
		end
		
	end

	def destroy
		@comment = @manual.comments.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html {redirect_to @manual}
			format.js
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def set_manual
		@manual = Manual.find(params[:manual_id])
	end

end