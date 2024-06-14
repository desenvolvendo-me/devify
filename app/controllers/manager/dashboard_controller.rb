module Manager
  class DashboardController < InternalController
    before_action :set_student_progress_data, only: :index

    def index
      @user = current_user
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
  end
end
