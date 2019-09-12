class ChecklistsController < ApplicationController

  def index
  	@checklists = Checklist.all
  end

  def show
  	set_checklist
  end

  def new
  	@checklist = current_user.checklists.new
  	@checklist.questions.build
  end

  def edit
  	set_checklist
  end

  def create
  	@checklist = current_user.checklists.build(checklist_params.merge(status: 'Draft'))
		if @checklist.save
			redirect_to @checklist
		else
			render 'new'
		end
  end

  def update
  	set_checklist
    # assign_attributes assign new attributes but in database old
    @checklist.assign_attributes(checklist_params)
    @checklist.published_at = DateTime.now if @checklist.status == 'Published'
  	if @checklist.save
  	  redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
		set_checklist
		@checklist.destroy
		redirect_to root_path
	end

  private

  	def set_checklist
  		@checklist = current_user.checklists.find(params[:id])
  	end

		def checklist_params
			params.require(:checklist).permit(:title, :description, :status, :user_id, questions_attributes: [:id, :question_text, :question_description, :_destroy])
		end
end
