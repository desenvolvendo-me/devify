module Students
  class ProfileMetricsSurvey
    TECH_WEIGHTS = {
      "Lógica de Programação" => 1,
      "Git e Github" => 1,
      "Html, Css e Javascript" => 2,
      "Linguagem de Programação" => 2,
      "Banco de Dados" => 3,
      "Framework" => 3
    }

    QUESTION_WEIGHTS = {
      study_duration: 3,
      communication_preference: 2,
      exposure_preference: 3
    }

    def initialize(student_profile)
      @student_profile = student_profile
    end

    def skills
      tech_count = @student_profile.technologies.sum { |tech| TECH_WEIGHTS[tech] || 0 }
      framework_count = @student_profile.web_framework_studied.sum { |framework| TECH_WEIGHTS[framework] || 0 }
      tech_count + framework_count
    end

    def language_mastery
      study_duration_points = study_duration_weights(@student_profile.study_duration) * QUESTION_WEIGHTS[:study_duration]
      study_duration_points
    end

    def exposure
      communication_preference = (@student_profile.communication_preference || 0) * QUESTION_WEIGHTS[:communication_preference]
      exposure_preference = (@student_profile.exposure_preference || 0) * QUESTION_WEIGHTS[:exposure_preference]
      communication_preference + exposure_preference
    end

    def calculate_survey_level
      total_points = skills + language_mastery + exposure
      level = determine_level(total_points)
      @student_profile.update(level_profile_survey: level)
      level
    end

    private

    def study_duration_weights(duration)
      case duration
      when 'Nunca'
        0
      when '+ou- 3 meses'
        3
      when '+ou- 6 meses'
        6
      when '+ou- 12 meses'
        9
      else
        0
      end
    end

    def determine_level(total_points)
      case total_points
      when 0..10
        1
      when 11..20
        2
      when 21..30
        3
      when 31..40
        4
      when 41..50
        5
      when 51..60
        6
      when 61..70
        7
      when 71..80
        8
      when 81..90
        9
      when 91..100
        10
      when 101..110
        11
      else
        12
      end
    end
  end
end
