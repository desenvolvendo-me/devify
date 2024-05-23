module Home
  class PrepareChart < BusinessApplication
    def initialize(programming_language, study_area)
      @programming_language = programming_language
      @study_area = study_area
    end

    def call
      prepare_data(@programming_language, @study_area)
    end

    private

    def prepare_data(programming_language, study_area)
      progress_data = StudentProgress.group_by_week(:date, format: "%d/%b/%Y")

      if programming_language.present?
        progress_data = progress_data.where(programming_language_id: programming_language)
      end

      if study_area.present?
        progress_data = progress_data.where(study_area_id: study_area)
      end

      progress_data = progress_data.sum(:value)

      limited_data = progress_data.first(30).to_h
    end
  end
end
