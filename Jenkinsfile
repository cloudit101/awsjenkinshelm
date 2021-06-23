pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                
                
                echo 'Hello World'
               
                withCredentials([usernamePassword(credentialsId: 'AWS', passwordVariable: 'password', usernameVariable: 'username')]) {
               
                sh 'echo "CONNECTING TO EKS"'
                sh '''
                   export PATH=$PATH:/usr/local/bin
                   export KUBECONFIG=/tmp/config
                   awscred.sh $username $password
                   /usr/local/bin/kubectl get nodes
                   helm ls
                   '''
                  }
                
            }
            
        }
        }
    }
  post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
    
}

