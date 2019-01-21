pipeline {
    agent { label 'master' }
    environment{
        TARGETDIR = '/var/www/artifacts'
    }
    stages {
        stage('Create Environment'){
            steps{
                echo env.WORKSPACE
                echo env.TARGETDIR
                script{
                    sh 'printenv'
                    sh 'echo ' + WORKSPACE
                    sh 'cp -r ' + WORKSPACE + ' ' + TARGETDIR
                    sh 'ls ' + TARGETDIR
                }
            }
        }
    }
}
