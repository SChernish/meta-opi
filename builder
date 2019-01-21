pipeline {
    agent { label 'master' }
    environment{
        DELIVERY_DIR = '/var/www/artifacts'        
    }
    stages {

        stage('Cloning source files'){
            steps{
                deleteDir()
                script{
                    bash '''
                        cd ${WORKSPACE}
                        echo  "+++++++++++++++++++++++++"
                        echo  "+    Clone devel-opi    +"
                        echo  "+++++++++++++++++++++++++"
                        git clone git://github.com/devel-opi/meta-opi.git
                        echo  "+++++++++++++++++++++++++"
                        echo  "+    Clone oe-core      +"
                        echo  "+++++++++++++++++++++++++"
                        git clone git://git.openembedded.org/openembedded-core oe-core
                        echo  "+++++++++++++++++++++++++"
                        echo  "+ Clone oe-core/bitbake +"
                        echo  "+++++++++++++++++++++++++"
                        git clone git://git.openembedded.org/bitbake oe-core/bitbake
                        echo  "+++++++++++++++++++++++++++"
                        echo  "+ Clone meta-openembedded +"
                        echo  "+++++++++++++++++++++++++++"                       
                        git clone git://git.openembedded.org/meta-openembedded
                    '''
                }
            }
        }

        stage('Configure environment'){
            steps{
                script{
                    bash '''
                        source oe-core/oe-init-build-env
                        cat ../meta-opi/bblayers.frag >> ./conf/bblayers.conf
                        cat ../meta-opi/conf.frag >> ./conf/local.conf
                    '''
                }
            }
        }

        stage('Delivery build'){
            steps{
                script{
                    bash '''
                        cd ${WORKSPACE}
                        tar -czvf ${DELIVERY_DIR}/${JOB_BASE_NAME}-build-${BUILD_NUMBER}.tar.gz -C ${WORKSPACE} --exclude '${WORKSPACE}/.git'
                    '''
                }
                deleteDir()
            }
        }

    }
}
