pipeline {
  agent {
    kubernetes {
      label 'dind'
      defaultContainer 'docker'
      yaml """
---
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: jenkins
spec:
  containers:
    - name: docker 
        image: docker:1.12.6 
        command: ['docker', 'run', '-p', '80:80', 'httpd:latest'] 
        resources: 
            requests: 
                cpu: 10m 
                memory: 256Mi 
        env: 
          - name: DOCKER_HOST 
            value: tcp://localhost:2375 

"""
    }
  }
  stages {
    stage('Run Docker Things') {
      steps {
        container('docker') {
        sh 'printenv'
        sh 'docker version'
        }
          
      }
    }
  }
}
