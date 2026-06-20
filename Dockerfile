FROM ubuntu:focal

# Installation des dépendances Linux obligatoires pour Godot 4
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libxrender1 \
    libxext6 \
    libx11-6 \
    libxcursor1 \
    libxi6 \
    libxrandr2 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Téléchargement et installation de Godot 4.3 Serveur Officiel
RUN wget https://github.com \
    && unzip Godot_v4.3-stable_linux.x86_64.zip \
    && mv Godot_v4.3-stable_linux.x86_64 /usr/local/bin/godot \
    && rm Godot_v4.3-stable_linux.x86_64.zip

# Copie de ton arène
COPY ServeurJeu.pck /app/ServeurJeu.pck
WORKDIR /app

EXPOSE 1234
CMD ["godot", "--headless", "--main-pack", "ServeurJeu.pck"]
