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

                // Debug - Verificar os arquivos e diretórios no workspace
                sh 'ls -l'
                sh 'cat Dockerfile'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        // Autenticar e enviar a imagem para o Docker Hub
                        docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS_ID) {
                            def customImage = docker.build(IMAGE_NAME)

                            // Debug - Listar imagens locais
                            sh 'docker images'

                            // Push a imagem ao Docker Hub
                            customImage.push()

                            echo "Imagem enviada ao Docker Hub: ${IMAGE_NAME}"
                        }
                    } catch (Exception e) {
                        error "Erro ao construir ou enviar a imagem Docker: ${e.getMessage()}"
                    }
                }
            }
        }
    }
}
