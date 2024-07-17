module Students
  class ProfileMetrics
    DIFFICULTY_POINTS = {
      'easy' => 1,
      'medium' => 2,
      'hard' => 3
    }

    COMPLEXITY_POINTS = {
      'low' => 1,
      'medium' => 2,
      'high' => 3
    }

    def initialize(student_profile)
      @student_profile = student_profile
    end

    def calculate_profile_level
      total_points = @student_profile.project_simulations.sum do |project|
        DIFFICULTY_POINTS[project.difficulty] + COMPLEXITY_POINTS[project.complexity]
      end

      level = determine_level(total_points)
      @student_profile.update(level_profile: level)
      level
    end

    private

    def determine_level(total_points)
      case total_points
      when 0..5
        1
      when 6..10
        2
      when 11..15
        3
      when 16..20
        4
      when 21..25
        5
      when 26..30
        6
      when 31..35
        7
      when 36..40
        8
      when 41..45
        9
      when 46..50
        10
      when 51..55
        11
      else
        12
      end
    end
  end
end
