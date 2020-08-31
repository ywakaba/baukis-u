class Admin::StaffEventsController < Admin::Base
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member.events
#      @events = @staff_member.events.order(occured_at: :desc)
    else
      @events = StaffEvent
#      @events = StaffEvent.order(occured_at: :desc)
    end
    @events = @events.order(occured_at: :desc).includes(:member).page(params[:page])
#    @events = @events.page(params[:page])
  end
end
