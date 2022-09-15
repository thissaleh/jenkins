

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
    image: docker
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  - name: dind
    image: docker:dind
    securityContext:
       privileged: true
    volumeMounts:
    - name: dind-storage
      mountPath: /var/lib/docker

   volumes:
   - name: dind-storage
     emptyDir: {}
   - name: docker-sock
     hostPath:
     path: /var/run/docker.sock  
       
       '''
        }
    }
    stages {
        stage('Build') {
        steps {
            container('ubuntu') {
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
