if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com', password: '000000', password_confirmation: '000000')

  user_1 = User.create!(name: 'User 1', email: 'user1@mail.com', password: '000000', password_confirmation: '000000', confirmed_at: Time.now)
  user_2 = User.create!(name: 'User 2', email: 'user2@mail.com', password: '000000', password_confirmation: '000000', confirmed_at: Time.now)
  user_3 = User.create!(name: 'User 3', email: 'user3@mail.com', password: '000000', password_confirmation: '000000', confirmed_at: Time.now)

  client_1 = Client.create!(document: '81939120047', user: user_1)
  client_2 = Client.create!(document: '66778473061', user: user_2)
  client_3 = Client.create!(document: '66778473061', user: user_3)

  user_1.client = client_1
  user_1.save
  user_2.client = client_2
  user_2.save

  student_profile_1 = StudentProfile.create!(user: user_1, main_language: "JavaScript" ,
                                             main_framework: "React" , track: "Front-End",
                                             github: "https://github.com/user1" , wakatime:"https://wakatime.com/@user1",
                                             linkedin: "https://linkedin.com/in/user1", instagram: "https://instagram.com/user1" ,
                                             technologies: %w[HTML CSS JavaScript], most_studied_language: ["JavaScript"],
                                             study_duration:"+ou- 6 meses", web_framework_studied: ["React"],
                                             web_framework_study_duration: "+ou- 6 meses",
                                             communication_preference: 7, exposure_preference: 5 )
  student_profile_2 = StudentProfile.create!(user: user_2, main_language: "Ruby" ,
                                             main_framework: "Rails" , track: "FullStack Monolito",
                                             github: "https://github.com/user2" , wakatime:"https://wakatime.com/@user2",
                                             linkedin: "https://linkedin.com/in/user2", instagram: "https://instagram.com/user2" ,
                                             technologies: ["HTML CSS JavaScript", "Git e Github"], most_studied_language: ["JavaScript"],
                                             study_duration:"+ou- 6 meses", web_framework_studied: %w[Rails React],
                                             web_framework_study_duration: "+ou- 6 meses",
                                             communication_preference: 8, exposure_preference: 2 )
  student_profile_3 = StudentProfile.create!(user: user_3, main_language: "Java" ,
                                             main_framework: "Spring" , track: "FullStack Monolito",
                                             github: "https://github.com/user2" , wakatime:"https://wakatime.com/@user2",
                                             linkedin: "https://linkedin.com/in/user2", instagram: "https://instagram.com/user2" ,
                                             technologies: ["Banco de Dados", "Linguagem de Programação"], most_studied_language: %w[Spring Hibernate],
                                             study_duration:"+ou- 6 meses", web_framework_studied: %w[Rails React],
                                             web_framework_study_duration: "+ou- 6 meses",
                                             communication_preference: 8, exposure_preference: 2 )


  user_1.avatar.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'avatar-1.jpg')), filename: 'avatar-1.jpg', content_type: 'image/jpg')

  goals_and_tasks = [
    { name: 'Aprender Linguagem Ruby', description: 'Quero criar 10 algoritmos em até 3 meses', status: 'done', client: client_1, tasks: [{ name: '1ª algoritmo', description: 'Criar o algoritmo bubble sort', status: 'done' }] },
    { name: 'Aprender Framework Rails', description: 'Quero criar 5 projetos simples em até 3 meses', status: 'todo', client: client_1, tasks: [{ name: '1ª projeto', description: 'Criar a editora de livros', status: 'todo' }] },
    { name: 'Aprender Linguagem Python', description: 'Quero criar 5 scripts úteis em até 2 meses', status: 'doing', client: client_1, tasks: [{ name: '1º script', description: 'Criar um algoritmo de automação de tarefas', status: 'doing' }] },
    { name: 'Aprender Banco de Dados SQL', description: 'Quero criar um banco de dados de livros em até 1 mês', status: 'todo', client: client_1, tasks: [{ name: '1ª tabela', description: 'Criar a tabela de livros', status: 'todo' }] },
    { name: 'Aprender Front-End Development', description: 'Quero construir um portfólio online em 2 semanas', status: 'done', client: client_1, tasks: [{ name: 'Página inicial', description: 'Criar a página inicial do meu portfólio', status: 'done' }] },
    { name: 'Aprender Linguagem JavaScript', description: 'Quero dominar os conceitos básicos em 1 mês', status: 'todo', client: client_1, tasks: [{ name: '1º exercício', description: 'Realizar um exercício de lógica em JavaScript', status: 'todo' }] },
    { name: 'Aprender Desenvolvimento Mobile', description: 'Quero criar um aplicativo simples em 2 meses', status: 'doing', client: client_1, tasks: [{ name: 'Protótipo de tela', description: 'Desenhar o protótipo da tela inicial do aplicativo', status: 'doing' }] },
    { name: 'Aprender Testes de Software', description: 'Quero escrever testes para um projeto em 1 mês', status: 'todo', client: client_1, tasks: [{ name: 'Configurar ambiente', description: 'Configurar o ambiente de testes no projeto', status: 'todo' }] },
    { name: 'Aprender Cloud Computing', description: 'Quero implantar um aplicativo em nuvem em 2 semanas', status: 'doing', client: client_1, tasks: [{ name: 'Configurar servidor', description: 'Configurar um servidor na nuvem', status: 'doing' }] },
    { name: 'Aprender Design de Interface', description: 'Quero criar um design para um site em 1 mês', status: 'todo', client: client_1, tasks: [{ name: 'Layout da página inicial', description: 'Criar o layout da página inicial do site', status: 'todo' }] },
    { name: 'Aprender Machine Learning', description: 'Quero criar um modelo de machine learning em 2 meses', status: 'done', client: client_1, tasks: [{ name: 'Coleta de dados', description: 'Coletar dados para treinar o modelo', status: 'done' }] },
    { name: 'Aprender Redes de Computadores', description: 'Quero configurar uma rede local em 3 semanas', status: 'todo', client: client_1, tasks: [{ name: 'Configurar roteadores', description: 'Configurar os roteadores da rede', status: 'todo' }] },
    { name: 'Aprender Segurança da Informação', description: 'Quero realizar um teste de penetração em 1 mês', status: 'doing', client: client_1, tasks: [{ name: 'Varredura de vulnerabilidades', description: 'Realizar uma varredura de vulnerabilidades no sistema', status: 'doing' }] },
    { name: 'Aprender Desenvolvimento Web Full-Stack', description: 'Quero criar um aplicativo completo em 2 meses', status: 'doing', client: client_1, tasks: [{ name: 'Desenvolvimento do backend', description: 'Iniciar o desenvolvimento do backend do aplicativo', status: 'doing' }] },
    { name: 'Aprender Inteligência Artificial', description: 'Quero criar um chatbot em 1 mês', status: 'done', client: client_2, tasks: [{ name: 'Treinamento do modelo', description: 'Treinar um modelo de chatbot', status: 'done' }] }
  ]

  goals_and_tasks.each do |goal_data|
    goal = Goal.create!(
      name: goal_data[:name],
      description: goal_data[:description],
      status: goal_data[:status],
      client: goal_data[:client]
    )

    goal_data[:tasks].each do |task_data|
      Task.create!(
        name: task_data[:name],
        description: task_data[:description],
        status: task_data[:status],
        goal: goal
      )
    end
  end

  goal_for_user_2 = Goal.create!(
    name: 'Aprender Go',
    description: 'Quero criar 3 projetos em Go em até 3 meses',
    status: 'todo',
    client: client_2
  )

  Task.create!(
    name: 'Primeiro projeto em Go',
    description: 'Criar um API RESTful com Go',
    status: 'todo',
    goal: goal_for_user_2
  )
end
