FROM barichello/godot:4.3
COPY ServeurJeu.pck /app/ServeurJeu.pck
WORKDIR /app
EXPOSE 1234
CMD ["godot", "--headless", "--main-pack", "ServeurJeu.pck"]
