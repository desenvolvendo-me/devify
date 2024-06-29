module Manager
  class DashboardController < InternalController
    before_action :set_user, only: :index
    before_action :set_student_progress_data, only: :index
    before_action :set_level, only: :index

    def index
      @languages = ProgrammingLanguage.all
      @areas = StudyArea.all
      @marks = StudentProgress.select(:mark).distinct.order(:mark).pluck(:mark)
    end

    private

    def set_student_progress_data
      @student_progress_data = Home::PrepareChart
                               .new(@user, params[:mark], params[:language], params[:area])
                               .call
    end

    def set_level
      @level_profile = ::Students::ProfileMetricsService
                 .new(@user.student_profile).calculate_profile_level
      @level_survey = ::Students::StudentProfileMetricsService
                        .new(@user.student_profile).calculate_survey_level
    end

    def set_user
      @user = current_user
    end
  end
end
