pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'https://registry.hub.docker.com/'
        DOCKER_CREDENTIALS_ID = 'fabiorocha-dockerhub'
        IMAGE_NAME = 'fabiorocha-dockerhub/gestao_projetos:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Fabi0290/Gestao_projetos.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS_ID) {
                            // Construir a imagem Docker
                            def customImage = docker.build(IMAGE_NAME)
                            echo "Imagem construída: ${IMAGE_NAME}"
                            
                            // Enviar a imagem para o Docker Hub
                            customImage.push()
                            echo "Imagem enviada ao Docker Hub!"
                        }
                    } catch (Exception e) {
                        error "Erro ao construir ou enviar a imagem: ${e.getMessage()}"
                    }
                }
            }
        }
    }
}
