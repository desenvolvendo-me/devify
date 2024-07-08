module Students
  class StudentProfileMetricsService
    TECH_WEIGHTS = {
      'Lógica de Programação' => 1,
      'Git e Github' => 1,
      'Html, Css e Javascript' => 2,
      'Linguagem de Programação' => 2,
      'Banco de Dados' => 3,
      'Framework' => 3
    }.freeze

    QUESTION_WEIGHTS = {
      study_duration: 3,
      web_framework_study_duration: 4,
      communication_preference: 2,
      exposure_preference: 3
    }.freeze

    def initialize(student_profile)
      @student_profile = student_profile
    end

    def skills
      tech_count = @student_profile.technologies.sum do |tech|
        TECH_WEIGHTS[tech] || 0
      end
      framework_count = @student_profile.web_framework_studied.sum do |framework|
        TECH_WEIGHTS[framework] || 0
      end
      other_tech_count = @student_profile.technology_other_details.count
      tech_count + framework_count + other_tech_count
    end

    def language_mastery
      study_duration_points = parse_study_duration(
        @student_profile.study_duration, @student_profile.study_duration_details
      ) * QUESTION_WEIGHTS[:study_duration]
      framework_study_duration_points = parse_study_duration(
        @student_profile.web_framework_study_duration, @student_profile.web_framework_study_duration_details
      ) * QUESTION_WEIGHTS[:web_framework_study_duration]
      study_duration_points + framework_study_duration_points
    end

    def exposure
      communication_preference = (@student_profile.communication_preference || 0) * QUESTION_WEIGHTS[:communication_preference]
      exposure_preference = (@student_profile.exposure_preference || 0) * QUESTION_WEIGHTS[:exposure_preference]
      communication_preference + exposure_preference
    end

    def calculate_survey_level
      total_points = skills + language_mastery + exposure
      determine_level(total_points)
    end

    private

    def parse_study_duration(duration, other_details)
      case duration
      when 'Nunca'
        0
      when '+ou- 3 meses'
        3
      when '+ou- 6 meses'
        6
      when '+ou- 12 meses'
        9
      when 'Outro'
        other_details.to_i
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
