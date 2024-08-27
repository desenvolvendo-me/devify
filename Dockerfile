FROM ruby:2.7.5

# Instale o Node.js (versão 18) e o Yarn a partir da fonte oficial
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y yarn \
  && apt-get install -y build-essential libpq-dev git libfreetype6-dev gsfonts libmagickwand-dev imagemagick \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie o Gemfile e Gemfile.lock e instale as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copie o package.json e yarn.lock e instale dependências do Node
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copie o restante dos arquivos
COPY . .

# Instale as dependências do Tailwind
RUN yarn add esbuild

# Execute comandos de pré-compilação de assets
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
RUN bundle exec rails tailwindcss:build

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
