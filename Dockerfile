FROM chickenbellyfinn/godot:4.3

# Crée le dossier de l'application
WORKDIR /app

# Copie ton fichier d'arène compilé
COPY ServeurJeu.pck /app/ServeurJeu.pck

# Ouvre le port réseau
EXPOSE 1234

# Lance Godot en mode sans écran avec ton arène
CMD ["godot", "--headless", "--main-pack", "ServeurJeu.pck"]
