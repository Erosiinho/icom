FROM node:20-alpine

WORKDIR /app

# Installer les dépendances système
RUN apk add --no-cache python3 make g++

# Copier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le code source
COPY . .

# Exposer les ports
EXPOSE 9000 7001