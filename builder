pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    def source = "/var/lib/jenkins/workspace/META-OPI"
                    def target = "/var/www/artifacts"
                    sh 'CP ' + source + ' ' + target
                    sh 'ls ' + target
                }
            }
        }
    }
}
