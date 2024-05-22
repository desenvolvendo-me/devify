module Manager
  class HomeController < InternalController
    def index
      progress_data = StudentProgress.group_by_week(:date, format: "%d/%b/%Y")

      if params[:language].present?
        progress_data = progress_data.where(programming_language: params[:language])
      end

      if params[:area].present?
        progress_data = progress_data.where(study_area: params[:area])
      end

      progress_data = progress_data.sum(:value)

      limited_data = progress_data.first(30).to_h

      @student_progress_data = limited_data

      @languages = ProgrammingLanguage.all
      @areas = StudyArea.all
    end
  end
end
