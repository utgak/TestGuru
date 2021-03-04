class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: I18n.t("not_authorized") unless current_user.is_a?(Admin)
  end
end
