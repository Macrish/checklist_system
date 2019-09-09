class ChecklistsController < ApplicationController
  def index
  	@checklists = current_user.checklists.all
  end

  def show
  	checklist_set
  end

  def new
  	@checklist = current_user.checklists.new
  	@checklist.questions.build
  end

  def edit
  	checklist_set
  end

  def create
  	@checklist = current_user.checklists.build(checklist_params)
		if @checklist.save
			redirect_to @checklist
		else
			render 'new'
		end
  end

  def update
  	checklist_set
  	@checklist.update(checklist_params)
  	redirect_to root_path
  end

  def destroy
		checklist_set
		@checklist.destroy
		redirect_to root_path
	end

  private

  	def checklist_set
  		@checklist = current_user.checklists.find(params[:id])
  	end

		def checklist_params
			params.require(:checklist).permit(:title, :description, :user_id, questions_attributes: [:id, :question_text, :question_description, :_destroy])
		end
end
