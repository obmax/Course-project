class StepsController < ApplicationController
	def destroy
		@step = Step.find(params[:id])
	end
end
