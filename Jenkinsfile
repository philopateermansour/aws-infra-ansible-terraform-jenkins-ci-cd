pipeline {
    agent { label 'jenkins-agent' }

    stages {
        stage('Checkout Repo') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'philopater-github-credentials', url: 'https://github.com/philopateermansour/aws-infra-ansible-terraform-jenkins-ci-cd']])
            }
        }
        stage('Build Image') {
            steps {
                sh '''
                    cd website
                    docker build -t philopateer/philopateer-simple-website:latest .
                '''
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'philopateer-dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker push philopateer/philopateer-simple-website:latest
                        docker logout
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                    sh '''
                        docker rm -f philopateer-simple-website || true
                        docker run -d -p 80:80 --name philopateer-simple-website philopateer/philopateer-simple-website:latest
                    '''
        }
    }
}
}