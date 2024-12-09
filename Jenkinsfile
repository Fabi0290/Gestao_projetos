pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Clonar o repositório onde está o Dockerfile e o código da aplicação
                git branch: 'main', url: 'https://github.com/Fabi0290/Gestao_projetos.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Autenticar no Docker Hub e construir a imagem
                    docker.withRegistry('https://registry.hub.docker.com/', 'fabiorocha-dockerhub') {
                        // Substitua o nome da imagem e tag conforme necessário
                        def customImage = docker.build("fabiorocha-dockerhub/gestao_projetos:latest")
                        customImage.push()
                    }
                }
            }
        }
    }
}
