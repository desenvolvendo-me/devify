module Students
  class StudentProfileMetricsService
    def initialize(student_profile)
      @student_profile = student_profile
    end

    def skills
      tech_count = @student_profile.technologies.count
      framework_count = @student_profile.web_framework_studied.count
      other_tech_count = @student_profile.technology_other_details.count
      tech_count + framework_count + other_tech_count
    end

    def language_mastery
      study_duration_points = parse_study_duration(@student_profile.study_duration, @student_profile.study_duration_details)
      framework_study_duration_points = parse_study_duration(@student_profile.web_framework_study_duration, @student_profile.web_framework_study_duration_details)
      study_duration_points + framework_study_duration_points
    end

    def exposure
      communication_preference = @student_profile.communication_preference || 0
      exposure_preference = @student_profile.exposure_preference || 0
      ((communication_preference + exposure_preference) / 2.0).round
    end

    private

    def parse_study_duration(duration, other_details)
      points = case duration
               when "Nunca"
                 0
               when "+ou- 3 meses"
                 3
               when "+ou- 6 meses"
                 6
               when "+ou- 12 meses"
                 12
               when "Outro"
                 other_details.to_i
               else
                 0
               end
      points
    end
  end
end
