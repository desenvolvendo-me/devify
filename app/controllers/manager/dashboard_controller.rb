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
      @level_profile = @user.student_profile.level_profile
      @level_survey = @user.student_profile.level_profile_survey
    end

    def set_user
      @user = current_user
    end
  end
end
