FROM node:20-slim

# Installation des dépendances graphiques de base requises par Godot 4
RUN apt-get update && apt-get install -y \
    libxrender1 libxext6 libx11-6 libxcursor1 libxi6 libxrandr2 libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Téléchargement et installation automatique et propre de Godot 4.3 stable
RUN npm install -g godot-manager && godot-manager install 4.3-stable --global

# Copie de ton fichier d'arène
COPY ServeurJeu.pck /app/ServeurJeu.pck
WORKDIR /app

EXPOSE 1234
CMD ["godot", "--headless", "--main-pack", "ServeurJeu.pck"]
