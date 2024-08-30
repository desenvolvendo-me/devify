module Students
  class ProfileMetricsService
    def initialize(student_profile)
      @student_profile = student_profile
    end

    def calculate_profile_level
      # lógica para calcular o nível do perfil
      # por exemplo, com base em campos como `main_language`, `track`, etc.
      # retorne um número que represente o nível do perfil
      # substitua a lógica abaixo com a lógica real de cálculo
        @student_profile.level || 1  # Retorna o nível atual ou 1 como padrão
    end

    def unlock_content_based_on_level
      level = calculate_profile_level

      # Lógica de desbloqueio de conteúdo baseada no nível calculado
      case level 
      when 1
          unlock_level1_content
          # Inserir outros niveis
      else
        puts "No content unlocked!"
      end
    end

    # Método para desbloquear o conteúdo do nível 1
    def unlock_level1_content
      puts "content for level 1 unlocked"
    end

  end
end
