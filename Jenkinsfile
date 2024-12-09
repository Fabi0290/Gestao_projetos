pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'fabiorocha-dockerhub') {
                        def customImage = docker.build("fabiorocha-dockerhub/Gestao_projetos:latest")
                        customImage.push()
                    }
                }
            }
        }
    }
}
