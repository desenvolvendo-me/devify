if Rails.env.development?
  admin = AdminUser.find_or_create_by!(email: 'admin@mail.com') do |admin|
    admin.password = '000000'
    admin.password_confirmation = '000000'
  end

  user_1 = User.find_or_create_by!(email: 'user1@mail.com') do |user|
    user.name = 'User 1'
    user.password = '000000'
    user.password_confirmation = '000000'
    user.confirmed_at = Time.now
  end

  user_2 = User.find_or_create_by!(email: 'user2@mail.com') do |user|
    user.name = 'User 2'
    user.password = '000000'
    user.password_confirmation = '000000'
    user.confirmed_at = Time.now
  end

  client_1 = Client.find_or_create_by!(document: '81939120047', user: user_1)
  client_2 = Client.find_or_create_by!(document: '66778473061', user: user_2)

  user_1.client = client_1
  user_1.save
  user_2.client = client_2
  user_2.save

  user_1.avatar.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'avatar-1.jpg')),
                       filename: 'avatar-1', content_type: 'image/jpg')

  goals_data = [
    { name: 'Aprender Linguagem Ruby', description: 'Quero criar 10 algoritmos em até 3 meses', status: 'done', client: client_1 },
    { name: 'Aprender Framework Rails', description: 'Quero criar 5 projetos simples em até 3 meses', status: 'todo', client: client_1 },
    { name: 'Aprender Linguagem Python', description: 'Quero criar 5 scripts úteis em até 2 meses', status: 'doing', client: client_1 },
    { name: 'Aprender Banco de Dados SQL', description: 'Quero criar um banco de dados de livros em até 1 mês', status: 'todo', client: client_1 },
    { name: 'Aprender Front-End Development', description: 'Quero construir um portfólio online em 2 semanas', status: 'done', client: client_1 },
    { name: 'Aprender Linguagem JavaScript', description: 'Quero dominar os conceitos básicos em 1 mês', status: 'todo', client: client_1 },
    { name: 'Aprender Desenvolvimento Mobile', description: 'Quero criar um aplicativo simples em 2 meses', status: 'doing', client: client_1 },
    { name: 'Aprender Testes de Software', description: 'Quero escrever testes para um projeto em 1 mês', status: 'todo', client: client_1 },
    { name: 'Aprender Cloud Computing', description: 'Quero implantar um aplicativo em nuvem em 2 semanas', status: 'doing', client: client_1 },
    { name: 'Aprender Design de Interface', description: 'Quero criar um design para um site em 1 mês', status: 'todo', client: client_1 },
    { name: 'Aprender Machine Learning', description: 'Quero criar um modelo de machine learning em 2 meses', status: 'done', client: client_1 },
    { name: 'Aprender Redes de Computadores', description: 'Quero configurar uma rede local em 3 semanas', status: 'todo', client: client_1 },
    { name: 'Aprender Segurança da Informação', description: 'Quero realizar um teste de penetração em 1 mês', status: 'doing', client: client_1 },
    { name: 'Aprender Desenvolvimento Web Full-Stack', description: 'Quero criar um aplicativo completo em 2 meses', status: 'doing', client: client_1 },
    { name: 'Aprender Inteligência Artificial', description: 'Quero criar um chatbot em 1 mês', status: 'done', client: client_2 }
  ]

  goals_data.each do |goal_data|
    goal = Goal.find_or_create_by!(name: goal_data[:name], client: goal_data[:client]) do |g|
      g.description = goal_data[:description]
      g.status = goal_data[:status]
    end

    tasks_data = case goal.name
                 when 'Aprender Linguagem Ruby'
                   [{ name: '1ª algoritmo', description: 'Criar o algoritmo bubble sort', status: 'done' }]
                 when 'Aprender Framework Rails'
                   [{ name: '1ª projeto', description: 'Criar a editora de livros', status: 'todo' }]
                 when 'Aprender Linguagem Python'
                   [{ name: '1º script', description: 'Criar um algoritmo de automação de tarefas', status: 'doing' }]
                 when 'Aprender Banco de Dados SQL'
                   [{ name: '1ª tabela', description: 'Criar a tabela de livros', status: 'todo' }]
                 when 'Aprender Front-End Development'
                   [{ name: 'Página inicial', description: 'Criar a página inicial do meu portfólio', status: 'done' }]
                 when 'Aprender Linguagem JavaScript'
                   [{ name: '1º exercício', description: 'Realizar um exercício de lógica em JavaScript', status: 'todo' }]
                 when 'Aprender Desenvolvimento Mobile'
                   [{ name: 'Protótipo de tela', description: 'Desenhar o protótipo da tela inicial do aplicativo', status: 'doing' }]
                 when 'Aprender Testes de Software'
                   [{ name: 'Configurar ambiente', description: 'Configurar o ambiente de testes no projeto', status: 'todo' }]
                 when 'Aprender Cloud Computing'
                   [{ name: 'Configurar servidor', description: 'Configurar um servidor na nuvem', status: 'doing' }]
                 when 'Aprender Design de Interface'
                   [{ name: 'Layout da página inicial', description: 'Criar o layout da página inicial do site', status: 'todo' }]
                 when 'Aprender Machine Learning'
                   [{ name: 'Coleta de dados', description: 'Coletar dados para treinar o modelo', status: 'done' }]
                 when 'Aprender Redes de Computadores'
                   [{ name: 'Configurar roteadores', description: 'Configurar os roteadores da rede', status: 'todo' }]
                 when 'Aprender Segurança da Informação'
                   [{ name: 'Varredura de vulnerabilidades', description: 'Realizar uma varredura de vulnerabilidades no sistema', status: 'doing' }]
                 when 'Aprender Desenvolvimento Web Full-Stack'
                   [{ name: 'Desenvolvimento do backend', description: 'Iniciar o desenvolvimento do backend do aplicativo', status: 'doing' }]
                 when 'Aprender Inteligência Artificial'
                   [{ name: 'Treinamento do modelo', description: 'Treinar um modelo de chatbot', status: 'done' }]
                 else
                   []
                 end

    tasks_data.each do |task_data|
      Task.find_or_create_by!(name: task_data[:name], goal: goal) do |task|
        task.description = task_data[:description]
        task.status = task_data[:status]
      end
    end
  end
end

ProjectSimulation.create!(
  [
    {
      title: 'Desenvolvimento de Aplicação Web com Ruby on Rails',
      description: 'Crie uma aplicação completa utilizando Ruby on Rails, abrangendo desde a configuração do ambiente até a implementação de funcionalidades complexas.',
      objectives: 'Aprender conceitos fundamentais do Rails, MVC, ActiveRecord, e boas práticas de desenvolvimento.',
      tools: 'Ruby, Rails, PostgreSQL, Bootstrap',
      expected_results: 'Uma aplicação web funcional com autenticação, autorização, e CRUDs básicos.'
    },
    {
      title: 'API RESTful com Node.js e Express',
      description: 'Desenvolva uma API RESTful utilizando Node.js e Express, integrando com um banco de dados MongoDB.',
      objectives: 'Entender como construir APIs com Node.js, lidar com requisições HTTP, e realizar operações de CRUD.',
      tools: 'Node.js, Express, MongoDB, Postman',
      expected_results: 'Uma API RESTful funcional com endpoints para CRUD de recursos e documentação no Postman.'
    },
    {
      title: 'Aplicação de Machine Learning com Python',
      description: 'Implemente um modelo de machine learning utilizando Python e bibliotecas como scikit-learn e pandas.',
      objectives: 'Aprender os fundamentos de machine learning, pré-processamento de dados, e avaliação de modelos.',
      tools: 'Python, scikit-learn, pandas, Jupyter Notebook',
      expected_results: 'Um notebook Jupyter contendo todo o processo de análise de dados, treinamento do modelo e avaliação.'
    }
  ]
)
