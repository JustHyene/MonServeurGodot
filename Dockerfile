FROM ubuntu:focal

# Installation des dépendances Linux obligatoires pour Godot 4
RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    unzip \
    libxrender1 \
    libxext6 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Téléchargement direct du binaire serveur officiel Godot 4.3 stable
RUN wget https://github.com \
    && unzip Godot_v4.3-stable_linux.x86_64.zip \
    && mv Godot_v4.3-stable_linux.x86_64 /usr/local/bin/godot \
    && rm Godot_v4.3-stable_linux.x86_64.zip

WORKDIR /app

# Copie de ton fichier d'arène compilé
COPY ServeurJeu.pck /app/ServeurJeu.pck

EXPOSE 1234

# Commande de lancement officielle
CMD ["godot", "--headless", "--main-pack", "ServeurJeu.pck"]
