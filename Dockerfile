# Utilisation d'une image de base Apache
FROM httpd:alpine

# Copie du fichier index.html dans le répertoire /usr/local/apache2/htdocs/
COPY . /usr/local/apache2/htdocs/

# Exposition du port 80
EXPOSE 80

# Commande pour démarrer Apache
CMD ["httpd-foreground"]

