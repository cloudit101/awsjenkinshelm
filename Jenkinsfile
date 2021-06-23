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
                   ./awscred.sh $username $password
                   /usr/local/bin/kubectl get nodes
                   helm install demorel1 ./demo
                   helm ls
                   '''
                  }
                
            }
            
        }
    }
    
  post {
        always {
            sh 'echo "This will always run"'
        }
        success {
            sh 'echo "This will run only if successful" '
        }
        failure {
            sh 'echo "This will run only if failed" '
            
        }
        unstable {
            sh 'echo "This will run only if marked unstable" '
        }
        changed {
            sh 'echo "This will run only if changed, previously failed now success" '
            
        }
    }
    
}
