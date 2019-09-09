class ChecklistsController < ApplicationController
  def index
  	@checklists = current_user.checklists.all
  end

  def show
  	@checklist = current_user.checklists.find(params[:id])
  end

  def new
  	@checklist = current_user.checklists.new
  	@checklist.questions.build
  end

  def edit
  	@checklist = current_user.checklists.find(params[:id])
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
  	@checklist = current_user.checklists.find(params[:id])
  	@checklist.update(checklist_params)
  	redirect_to root_path
  end

  def destroy
		checklist = current_user.checklists.find(params[:id])
		checklist.destroy
		redirect_to root_path
	end

  private

		def checklist_params
			params.require(:checklist).permit(:title, :description, :user_id, questions_attributes: [:id, :question_text, :question_description, :_destroy])
		end
end
