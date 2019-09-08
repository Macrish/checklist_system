class ChecklistsController < ApplicationController
  def index
  end

  def show
  	@checklist = Checklist.find(params[:id])
  end

  def new
  	@checklist = Checklist.new
  end

  def create
  	@checklist = current_user.checklists.build(checklist_params)
		if @checklist.save
			redirect_to @checklist
		else
			render 'new'
		end
  end

  def destroy
		@checklist.destroy
		redirect_to root_path
	end

  private
		def checklist_params
			params.require(:checklist).permit(:title, :description, :user_id)
		end
end
