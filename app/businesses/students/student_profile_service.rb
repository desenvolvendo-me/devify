module Students
  class StudentProfileService
    def self.process_params(params)
      processed_params = params.dup

      # Processamento dos campos de tecnologias e linguagens mais estudadas
      if processed_params[:technology_other_details].present?
        processed_params[:technologies] += processed_params.delete(:technology_other_details).split(',').map(&:strip)
      end
      if processed_params[:most_studied_language_other_details].present?
        processed_params[:most_studied_language] += processed_params.delete(:most_studied_language_other_details).split(',').map(&:strip)
      end

      # Garantir que os valores de duração sejam inteiros
      if processed_params[:study_duration] == "Other" && processed_params[:study_duration_details].present?
        processed_params[:study_duration_details] = processed_params[:study_duration_details].to_i
      else
        processed_params[:study_duration_details] = 0 if processed_params[:study_duration] == "Never"
      end

      if processed_params[:web_framework_study_duration] == "Other" && processed_params[:web_framework_study_duration_details].present?
        processed_params[:web_framework_study_duration_details] = processed_params[:web_framework_study_duration_details].to_i
      else
        processed_params[:web_framework_study_duration_details] = 0 if processed_params[:web_framework_study_duration] == "Never"
      end

      processed_params
    end
  end
end
