pipeline {
    agent { label 'master' }
    environment{
        DELIVERY_DIR = '/var/www/artifacts'        
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    sh '''
                        cp -r ${WORKSPACE} ${DELIVERY_DIR}
                        ls ${DELIVERY_DIR}
                    sh '''
                }
                deleteDir()
            }
        }
    }
}

