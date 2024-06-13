module Home
  class PrepareChart < BusinessApplication
    def initialize(mark, programming_language, study_area)
      @mark = mark
      @programming_language = programming_language
      @study_area = study_area
    end

    def call
      prepare_data(@mark, @programming_language, @study_area)
    end

    private

    def prepare_data(mark, programming_language, study_area)
      progress_data = StudentProgress.group_by_week(:date, format: '%d/%b/%Y')

      progress_data = progress_data.where('mark <= ?', mark) if mark.present?

      if programming_language.present?
        progress_data = progress_data
                        .where(programming_language_id: programming_language)
      end

      if study_area.present?
        progress_data = progress_data.where(study_area_id: study_area)
      end

      progress_data = progress_data.sum(:value)

      progress_data.to_h
    end
  end
end
