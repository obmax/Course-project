class TagsController < ApplicationController
	def show
		@tag = Tag.find_by(name: params[:id]).include(:name)
		@manuals = @tag.manuals.order("created_at DESC")
	end
end