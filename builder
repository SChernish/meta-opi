node {
   echo 'Hello World'
   stage('Preparation') {
       echo “Test Preparation”
       echo “BUILD ID $BUILD_NUMBER” 
   }
}
