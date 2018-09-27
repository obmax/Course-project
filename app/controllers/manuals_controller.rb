class ManualsController < ApplicationController
	load_and_authorize_resource
	before_action :set_manual, only: [:show, :edit, :update, :destroy, :vote]
	respond_to :js, :html
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	rescue_from RangeError, with: :range_error

	def index
		@manuals = Manual.all.order("created_at DESC").includes(:category,:tags).paginate(page: params[:page], per_page: 10)
	end

	def show
		@steps = Step.where(manual_id: @manual.id).paginate(page: params[:page], per_page: 1)
		@comments = @manual.comments
	end

def meth(str1, str2)
  str1.chars.sort == str2.chars.sort
end

	def create
		@manual = Manual.new(manual_params)
		@manual.user_id = current_user.id
		if @manual.save
			redirect_to @manual, success: 'Manual has been succesfuly created!'
		else
			flash.now[:danger] = 'Manual has not been created!'
			render :new
		end
	end

	def edit
	end

	def update
		if @manual.update_attributes(manual_params)
			redirect_to @manual, success: 'Manual has been succesfuly updated!'
		else
			flash.now[:danger] = 'Manual has not been updated!'			
			render :edit
		end
	end

	def destroy
		@manual.destroy
		redirect_to manuals_path, success: 'Manual has been succesfuly deleted!'
	end

	def vote
		if !current_user.liked? @manual
			@manual.liked_by current_user
		elsif current_user.liked? @manual
			@manual.unliked_by current_user
		end		
	end

	private

	def set_manual
		@manual = Manual.find(params[:id])
	end

	def manual_params
		params.require(:manual).permit(:title, :summary, :body, :all_tags, :category_id, :image, steps_attributes: Step.attribute_names.map(&:to_sym).push(:image, :_destroy))
	end


	def record_not_found
		redirect_to root_url
		flash[:danger]="Manual not found"
	end

	def range_error
		redirect_to root_url
		flash[:danger]="Manual not found"
	end
end
