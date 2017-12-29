node {
    /* Variables */   
    def app
    def user
    def pass
       
    stage('Clone repository') {
        /* Github est à jour dans l'espace de travail */ 
        checkout scm
    }

    stage('Build image') {             
        /* Construction de l'image nommé "hlopezr/nginx-server:#" */
        app = docker.build("hlopezr/nginx-server:${env.BUILD_NUMBER}")
    }
       
    stage('Login Docker Hub') {  
        /* Recuperation de l'utilisateur et le pass */
        withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            user = "$USERNAME"
            pass = "$PASSWORD"      
            echo "User: " + user
            echo "Pass: " + pass
        }
       
        /* Login dans le docker hub */
        docker.withRegistry('https://registry.hub.docker.com', '293fb43d-ca16-48f1-998a-17ef5c08ffe9') {
            sh "docker login -u hlopezr -p Hlopez1056 https://index.docker.io/v1/"       
        }                             
       
    }
   
    stage('Push image') {  
        /* Pousser l'image docker */
        app.push("${env.BUILD_NUMBER}")                                
    }
}
