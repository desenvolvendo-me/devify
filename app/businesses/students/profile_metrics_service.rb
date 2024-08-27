module Students
  class ProfileMetricsService
    def initialize(student_profile)
      @student_profile = student_profile
    end

    def calculate_profile_level
      # Lógica para calcular o nível do perfil
      6
    end

    def technologies
      # Substitua a lógica abaixo conforme necessário para se adequar ao seu projeto
      @student_profile.technologies || []
    end
  end
end
