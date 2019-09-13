class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    set_form
  end

  def new
    @form = current_user.forms.new
    @form.questions.build
  end

  def edit
    set_form
  end

  def create
    @form = current_user.forms.build(form_params.merge(status: 'Draft'))
    if @form.save
      redirect_to @form
    else
      render 'new'
    end
  end

  def update
    set_form
    # assign_attributes assign new attributes but in database old
    @form.assign_attributes(form_params)
    @form.published_at = DateTime.now if @form.status == 'Published'
    if @form.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    set_form
    @form.destroy
    redirect_to root_path
  end

  private

    def set_form
      @form = current_user.forms.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:title, :description, :status, :user_id, questions_attributes: [:id, :question_text, :question_description, :_destroy])
    end
end
