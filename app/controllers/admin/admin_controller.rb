class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin

	protected

	def check_admin
		unless current_user.admin?
			redirect_to root_path
			flash[:danger] = "Your not have roots" 
		end
	end
end