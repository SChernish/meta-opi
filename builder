pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    def source = "/var/lib/jenkins/workspace/META-OPI"
                    def target = "/var/www/artifacts"
                    sh 'cp -r ' + source + ' ' + target
                    sh 'ls ' + target
                }
            }
        }
    }
}
