pipeline {
    agent any

    environment {
        gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    }
    
    stages {
        stage('Lint') {
            agent {
               docker { image 'hadolint/hadolint' } 
            }
            steps {
                hadolint Dockerfile
            }
        }
        stage('Build') {
            steps {
                sh 'docker build . --force-rm -t brodster22/jenkins-with-docker:${gitCommit}'
            }
        }
        stage('Publish') {
            when {
                branch 'master'
            }
            steps {

                sh 'docker tag brodster22/jenkins-with-docker:${env.gitCommit} brodster22/jenkins-with-docker:latest'

                withDockerRegistry([ credentialsId: "8fd008e3-6903-45bf-a17e-2aa7fe1dbb51", url: "" ]) {
                    sh 'docker push brodster22/jenkins-with-docker:${env.gitCommit}'
                    sh 'docker push brodster22/jenkins-with-docker:latest'
                }
            }
        }
    }
}