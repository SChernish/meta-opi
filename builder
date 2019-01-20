pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment') {
            steps {
                echo "Hello World!"
                sh "echo Hello from the shell"
                sh "hostname"
                sh "uptime"
            }
        }
        stage('Getting sources') {
            steps {
                scripts {
                    def context = "/var/www/artifacts"
                    echo "COPY TO DIRECTORY"
                    cp ${WORKSPACE} $context
                 }
            }
        }
   }
}
