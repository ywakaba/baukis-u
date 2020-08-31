class Admin::StaffMembersController < Admin::Base
#  before_action :authorize
  def index
    logger.debug("Enter Admin::StaffMembersController#index")
    @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
  end
  def show
    @staff_member = StaffMember.find(params[:id])
    redirect_to[ :edit, :admin, staff_member ]
  end
  def new
    logger.debug("Enter Admin::StaffMembersController#new")
    @staff_member = StaffMember.new
  end
  def edit
    logger.debug("Enter Admin::StaffMembersController#edit")
    @staff_member = StaffMember.find(params[:id])
  end
  def create
    logger.debug("Enter Admin::StaffMembersController#create")
#     @staff_member = StaffMember.new(params[:staff_member])
     @staff_member = StaffMember.new(staff_member_params)
     if @staff_member.save
       flash.notice = '職員アカウントを新規登録しました。'
       redirect_to :admin_staff_members
     else
       render action: 'new'
     end
  end
  def update
    logger.debug("Enter Admin::StaffMembersController#update")
    @staff_member = StaffMember.find(params[:id])
#    @staff_member.assign_attributes(params[:staff_member])
    @staff_member.assign_attributes(staff_member_params)
    if @staff_member.save
      flash.notice = '職員アカウントを更新しました。'
      redirect_to :admin_staff_members
    else
      render action: 'edit'
    end
  end
  def destroy
    logger.debug("Enter Admin::StaffMembersController#destroy")
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy!
    flash.notice = '職員アカウントを削除しました。'
    redirect_to :admin_staff_members
  end

  private
  def staff_member_params
    params.require(:staff_member).permit(
#    params.require(:staff).permit(
      :email, :password, :family_name, :family_name_kana,
      :given_name, :given_name_kana, :start_date,
#      :given_name_kana, :start_date,
      :end_date, :suspended
    )
  end
end
