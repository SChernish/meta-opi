pipeline {
    agent { label 'master' }
    environment {
        SOURCE = ${WORKSPACE}
        TARGET = "/var/www/artifacts"
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    sh 'cp -r ' + ${SOURCE} + ' ' + ${TARGET}
                    sh 'ls ' + ${TARGET}
                }
            }
        }
    }
}
