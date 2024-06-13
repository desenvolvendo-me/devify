module StudentProgressSeeder
  def self.generate_values(start_value, increments, drops)
    values = []
    current_value = start_value

    10.times do |i|
      if drops.include?(i)
        current_value -= 1 # Apply a drop
      else
        current_value += increments
      end
      values << current_value
    end

    values
  end

  def self.create_programming_language(languages)
    languages.map { |language| ProgrammingLanguage.create(name: language) }
  end

  def self.create_study_area(areas)
    areas.map { |area| StudyArea.create(name: area) }
  end

  def self.generate_progress_entry(date, phase, language_records, area_records, value, user)
    {
      date: date,
      mark: phase,
      programming_language_id: language_records.sample.id,
      study_area_id: area_records.sample.id,
      value: value,
      user_id: user.id
    }
  end

  def self.calculate_date(index, i)
    Date.today - ((5 * 10) - (index * 10 + i + 1)).weeks
  end

  def self.generate_phase_values(params)
    generate_values(params[:start_value], params[:increments], params[:drops][params[:phase]])
  end

  def self.generate_phase_progress_entries(values, params)
    values.each_with_index.map do |value, i|
      date = calculate_date(params[:index], i)
      generate_progress_entry(date, params[:phase], params[:language_records], params[:area_records], value, params[:user])
    end
  end

  def self.generate_phase_progress_data(params)
    values = generate_phase_values(params)
    generate_phase_progress_entries(values, params)
  end

  def self.create_progress_data(params)
    increments = params[:increments]
    phases = params[:phases]
    drops = params[:drops]
    language_records = params[:language_records]
    area_records = params[:area_records]

    progress_data = []
    params[:users].each do |user|
      phases.each_with_index do |phase, index|
        start_value = index * 10 + rand(-5..5) # Variação no valor inicial
        phase_params = {
          start_value: start_value,
          increments: increments + rand(-1..1), # Variação nos incrementos
          drops: drops.transform_values { |drop_points| drop_points.map { |drop| drop + rand(-1..1) } }, # Variação nos drops
          phase: phase,
          index: index,
          language_records: language_records,
          area_records: area_records,
          user: user
        }
        progress_data += generate_phase_progress_data(phase_params)
      end
    end
    StudentProgress.create(progress_data)
  end

  def self.student_progress_seed
    languages = %w[Ruby Java Python JavaScript C++ C#]
    language_records = create_programming_language(languages)

    areas = ['Backend', 'Frontend', 'Data Science', 'Mobile Development', 'DevOps']
    area_records = create_study_area(areas)

    increments = 3
    phases = %w[f0 f1 f2 f3 f4]
    drops = {
      'f0' => [3, 7], 'f1' => [2, 6], 'f2' => [1, 8], 'f3' => [4, 9],
      'f4' => [5, 7]
    }

    users = User.all

    create_progress_data(
      increments: increments,
      phases: phases,
      drops: drops,
      language_records: language_records,
      area_records: area_records,
      users: users
    )
  end
end
