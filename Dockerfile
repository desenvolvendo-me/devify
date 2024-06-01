FROM ruby:2.7.5

# Instale o Node.js e o Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# Instale dependências do sistema
ARG INSTALL_DEPENDENCIES
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ${INSTALL_DEPENDENCIES} \
    build-essential libpq-dev git libfreetype6-dev gsfonts libmagickwand-dev imagemagick && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie os arquivos da aplicação
COPY . .

# Instale as gems do Bundler
RUN bundle install

# Instale dependências do Node.js e Tailwind
RUN rm -rf node_modules && npm install && npm install esbuild

# Pré-compile e limpe os assets
#RUN bundle exec rake assets:precompile
#RUN bundle exec rake assets:clean
#RUN bin/rails tailwindcss:build

# Instala railsui
RUN rails railsui:install

# Exponha a porta da aplicação
EXPOSE 3000

# Comando padrão para iniciar a aplicação
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
