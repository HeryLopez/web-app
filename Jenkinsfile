node {
    def app
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {
        app = docker.build("hlopezr/nginx-server:${env.BUILD_NUMBER}")
    }
    
    stage('Push image') {             
        docker.withRegistry('https://registry.hub.docker.com', '293fb43d-ca16-48f1-998a-17ef5c08ffe9') {
            sh "docker login -u hlopezr -p Hlopez1056 https://index.docker.io/v1/"       
        }                             
        app.push("${env.BUILD_NUMBER}")                                
    }
}
