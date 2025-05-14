pipeline {
       // Exécute le pipeline sur n'importe quel agent 
    agent any 
 
 // Déclarer les variables d'environnement globales 
    environment { 
        // votre  username Docker Hub 
        DOCKER_USERNAME = "chrismal"    
       // version dynamique de l'image 
        IMAGE_VERSION = "1.${BUILD_NUMBER}"  
      // nom de l'image docker 
        DOCKER_IMAGE = "${DOCKER_USERNAME}/tp-app:${IMAGE_VERSION}"  
     // nom du conteneur 
        DOCKER_CONTAINER = "ci-cd-html-css-app"  
     // Identifiants Docker Hub 
        DOCKER_CREDENTIALS = credentials("60e3f15b-0137-4656-a766-b08adcb8e3f5") 
    }
    // Les étapes du pipeline
    stages {
        // Étape 1 : Récupération du code source depuis GitHub
        stage("Checkout") {
            steps {
                // récupérer la branche 'master' du repository distant
                git branch: 'master', url: 'https://github.com/ditdevops1/ci-cd-html-css-demo.git'
            }
        }
        // Étape 2 : Exécution des tests
        stage("Test") {
            steps {
                // faire des  tests
                echo "Tests en cours"
            }
        }
        // Étape 3 : Création  de l'image Docker
        // si vous travaillez sur windows , utliser bat et sur linux utiliser sh
        stage("Build Docker Image") {
            steps {
                script {
                    // Créer l'image Docker
                    bat  "docker build -t $DOCKER_IMAGE ."
                }
            }
        }
        // Étape 4 : Publication de  l'image sur  Docker Hub
        stage("Push image to Docker Hub") {
            steps {
                script {
                    bat """
                    # Connexion à Docker Hub
                    docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PSW}
                    echo 'Docker login successful'
                    # Push l'image sur Docker Hub
                    docker push $DOCKER_IMAGE
                    """
                }
            }
        }
        // Déploiement de l'application
        stage("Deploy") {
            steps {
                script {
                    // Lancer le conteneur
                    bat """
                    docker run -d --name $DOCKER_CONTAINER -p 8080:80 $DOCKER_IMAGE
                    """
                }
            }
        }
    }
}