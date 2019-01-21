pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    def target = "/var/www/artifacts"
                    sh 'CP ' + $WOKSPACE + ' ' + target
                    sh 'ls ' + target
                }
            }
        }
    }
}
