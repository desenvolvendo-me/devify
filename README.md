[//]: # (![Startup Mission Base]&#40;readme_docs/doc_images/statup-mission-base.png&#41;)

---

# Projeto Devify

![Ruby](https://img.shields.io/badge/Ruby-2.7.5-red)
![Rails](https://img.shields.io/badge/Rails-7.0.4-blue)

## Objetivo

Criar uma arquitetura de referência para facilitar a criação de microSaaS junto com os alunos, proporcionando uma experiência tão fácil quanto [Bubble.io](https://bubble.io/), mas mais próxima dos projetos [JumpstartRails](https://jumpstartrails.com/), [AvoHQ](https://avohq.io/) e [ShipFast](https://shipfa.st/). O foco é facilitar a vida do programador na criação de novas ideias, já que nossos alunos querem ser programadores e não empresários.

## API

Para documentar as APIs, usamos o Swagger. Confira [este vídeo](https://www.youtube.com/watch?v=4_s66AeuM5c) para aprender a usar o Swagger.

## Qualidade

- **Teste:** ativado
- **Lint:** ativado
- **Cobertura:** 80%
- **Score:** 90

### Análise

#### Teste e Cobertura
```
bundle exec rspec
```

#### Lint
```
bundle exec rubocop
```

#### Score
```
bundle exec rubycritic
```

## Configuração

### Pré-requisitos
Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), um gerenciador de versões como o [ASDF](https://asdf-vm.com) e além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)


#####  Gere o Banco de Dados Local e também rode as migracões da aplicação
```bash
$ rails db:create
```

##### Este comando irá criar o banco de dados local conforme configurado no arquivo config/database.yml do seu projeto. Certifique-se de que suas configurações no arquivo [database.yml]() estejam corretas para o ambiente de desenvolvimento.

#####  Gere as migracões da aplicação
```bash
$ rails db:migrate
```

### Tailwind

 ```bash
 npm install esbuild
```

##### ➡️  Iniciando a Aplicação com o framework Tailwind
```bash
$ foreman start -f Procfile.dev
```
ou 

```bash
$ bin/dev
```

##### Caso o comando acima, não funcione, seguir o procedimento abaixo:
```bash
# --- execuções do arquivo Dockerfile ---

 rm -rf node_modules && npm install
```
 ```bash
 npm install esbuild
```

```bash
 bundle exec rake assets:precompile
```

```bash
 bundle exec rake assets:clean
```

```bash
 bundle exec rails tailwindcss:build 
```
##### ⚠️  Persistindo algum erro, seguir os procedimentos abaixo:

##### 🔹 Execute este comando para atualizar o Bundler
```bash
$  gem install bundler:2.4.20
```
##### 🔹 Execute este comando:
```bash
$  bundle exec rails tailwindcss:build
```
##### ➡️  Execute o comando para subir o servidor da aplicação:
```bash
$  bundle exec rails s    
```
---

### RailsUI

#### Gemfile
```
bundle install
```

#### Node.js
```
npm install
```

#### Instalar RailsUI
```
rails railsui:install
```

#### Redis
```
redis-server
```

#### Migrar Banco de Dados
```
rails db:drop && rails db:create && rails db:migrate && rails db:seed RAILS_ENV=development
```

#### Executando o Servidor
```
bin/dev
```

### Docker

#### Criando
```
docker-compose up --build
```

#### Executando
```
docker compose up
```
```
docker-compose run web rails db:create
```
```
docker-compose run web rails db:migrate
```
```
docker-compose run web rspec
```

## Stripe

Para usar o Stripe, veja a [documentação oficial](https://github.com/stripe/stripe-ruby).

### Cenários

1. **Conta Personalizada**
    - Siga os passos em [stripe.com](https://docs.stripe.com/payments) para criar uma conta personalizada.
    - Altere a `secret_key` para a sua chave personalizada:
      ```yaml
      stripe:
        public_key: your_public_key
        secret_key: your_secret_key
      ```

2. **Conta de Demonstração**
    - Solicite a `secret_key` para usar a conta de demonstração. Entre em contato com os usuários do Discord:
        - Edson Shideki Kokado (edsonshidekikokado)
        - Pablo Maciel (pjmaciel)

### Instalando
Adicione a gem do Stripe ao seu Gemfile:
```ruby
gem 'stripe'
```
Em seguida, execute o bundle:
```
bundle install
```

### Configurando
1. Configure suas chaves de API do Stripe no arquivo `credentials.yml.enc`. Você pode fazer isso com o editor de credenciais do Rails:
```
EDITOR="nano" bin/rails credentials:edit
```
Adicione as suas chaves do Stripe:
```yaml
stripe:
  public_key: your_public_key
  secret_key: your_secret_key
```

2. Inicialize o Stripe no seu aplicativo. Crie um inicializador `config/initializers/stripe.rb`:
```ruby
Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
```

3. Veja o repositorio do stripe para ruby https://github.com/stripe/stripe-ruby para usar as informações de configuraçoes atualizadas.


---
