class CategoriesController < ApplicationController

	before_action :set_category, only: [:show]

	def show
		@manuals = @category.manuals.order("created_at DESC").include(:category)
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end
end
