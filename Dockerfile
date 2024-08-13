FROM ruby:2.7.5

# Install node (update to Node.js 18) & remove existing Yarn installation if present
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && apt-get remove -y yarn

# Install Yarn from official source
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y yarn

# Install base deps or additional (e.g. tesseract)
ARG INSTALL_DEPENDENCIES
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends ${INSTALL_DEPENDENCIES} \
    build-essential libpq-dev git libfreetype6-dev gsfonts libmagickwand-dev imagemagick \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie apenas o Gemfile e Gemfile.lock inicialmente para instalar as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copie apenas o package.json e yarn.lock para instalar dependências do Node
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copie o restante dos arquivos
COPY . .

# Instale as dependências do Tailwind
RUN npm install esbuild

# Execute comandos de pré-compilação de assets
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
RUN bundle exec rails tailwindcss:build

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
