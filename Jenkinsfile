

// Uses Declarative syntax to run commands inside a container.
pipeline {
    agent {
        kubernetes {
            // Rather than inline YAML, in a multibranch Pipeline you could use: yamlFile 'jenkins-pod.yaml'
            // Or, to avoid YAML:
            // containerTemplate {
            //     name 'shell'
            //     image 'ubuntu'
            //     command 'sleep'
            //     args 'infinity'
            // }
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: shell
    image: ubuntu
    command:
    - sleep
    args:
    - infinity
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
  - name: docker-sock
    hostPath:
    path: /var/run/docker.sock 
'''
       
        }
    }
    stages {
        stage('Main') {
        steps {
            container('shell') {
              sh 'hostname'
             }
        }
       }

       stage('Build-Docker-Image') {
         steps {
           container('docker') {
             sh 'docker build -t jenkins/inbound-agent:latest .'
           }
         }
       }


    }   
}
