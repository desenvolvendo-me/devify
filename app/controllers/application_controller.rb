class ApplicationController < ActionController::Base
  helper Railsui::ThemeHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
  before_action :set_tenant
  before_action :set_user_profile

  set_current_tenant_through_filter

  private

  def set_tenant
    set_current_tenant(current_user.client) if current_user
  end

  def set_user_profile
    if user_signed_in? && current_user.student_profile.present?
      @user_profile = current_user
      profile_metrics_service = Students::ProfileMetricsService.new(@user_profile.student_profile)
      @level_profile = profile_metrics_service.calculate_profile_level
      # @points = profile_metrics_service.calculate_points
      # A linha acima está comentada, pois os pontos serão implementados em outra tarefa
    else
      @user_profile = nil
      @level_profile = nil
      # @points = nil
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :avatar, { client_attributes: [:document] },
                       { student_profile_attributes: %i[main_language track] }]
    )
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: [
        :name, :avatar, { client_attributes: [:document] },
        { student_profile_attributes: %i[main_language track] }
      ]
    )
  end
end
