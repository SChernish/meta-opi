pipeline {
    agent { label 'master' }
    environment{
        DELIVERY_DIR = '/var/www/artifacts'        
    }
    stages {

        stage('Cloning source files'){
            steps{
                script{
                    sh '''
                        cd ${WORKSPACE}
                        echo -e "+++++++++++++++++++++++++"
                        echo -e "+    Clone devel-opi    +"
                        echo -e "+++++++++++++++++++++++++"
                        git clone git://github.com/devel-opi/meta-opi.git
                        echo -e "+++++++++++++++++++++++++"
                        echo -e "+    Clone oe-core      +"
                        echo -e "+++++++++++++++++++++++++"
                        git clone git://git.openembedded.org/openembedded-core oe-core
                        echo -e "+++++++++++++++++++++++++"
                        echo -e "+ Clone oe-core/bitbake +"
                        echo -e "+++++++++++++++++++++++++"
                        git clone git://git.openembedded.org/bitbake oe-core/bitbake
                        echo -e "+++++++++++++++++++++++++++"
                        echo -e "+ Clone meta-openembedded +"
                        echo -e "+++++++++++++++++++++++++++"                       
                        git clone git://git.openembedded.org/meta-openembedded
                    sh '''
                }
            }
        }

        stage('Configure environment'){
            steps{
                script{
                    sh '''
                        source oe-core/oe-init-build-env
                        cat ../meta-opi/bblayers.frag >> ./conf/bblayers.conf
                        cat ../meta-opi/conf.frag >> ./conf/local.conf
                    sh '''
                }
            }
        }

        stage('Delivery build'){
            steps{
                script{
                    sh '''
                        cd ${WORKSPACE}
                        tar -czvf ${DELIVERY_DIR}/${JOB_BASE_NAME}-build-${BUILD_NUMBER}.tar.gz -C ${WORKSPACE} --exclude '${WORKSPACE}/.git'
                    sh '''
                }
                deleteDir()
            }
        }

    }
}

