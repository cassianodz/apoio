class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def show
    @meetings = Meeting.all
  end

  def datepicker_input form, field
    content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'dd-mm-yyyy', 'date-autoclose' => 'true', 'language' => 'pt'} do
      form.text_field field, class: 'form-control', placeholder: 'DD-MM-YYYY'
    end
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to :show_meeting
  end

  def create
    # binding.pry
    @meeting = Meeting.new(meeting_params)
    @meeting.name = current_user.nome
    @meeting.user_id = current_user.id
    @meeting.save
    redirect_to :rause
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :id)
  end

end
