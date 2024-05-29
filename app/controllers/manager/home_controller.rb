module Manager
  class HomeController < InternalController
    before_action :set_student_progress_data, only: :index

    def index
      @languages = ProgrammingLanguage.all
      @areas = StudyArea.all
      @marks = StudentProgress.select(:mark).distinct.order(:mark).pluck(:mark)
    end

    private

    def set_student_progress_data
      @student_progress_data = Home::PrepareChart
                               .new(params[:mark], params[:language], params[:area])
                               .call
    end
  end
end
