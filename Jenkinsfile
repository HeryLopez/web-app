node {
    /* Variables */   
    def app
       
    stage('Clone repository') {
        /* Github est à jour dans l'espace de travail */ 
        checkout scm
    }

    stage('Build image') {             
        /* Construction de l'image nommé "hlopezr/nginx-server:#" */
        app = docker.build("hlopezr/nginx-server:${env.BUILD_NUMBER}")
    }
       
    stage('Login Docker Hub') {  
        /* Login dans le docker hub */
        withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {                       
            sh "docker login -u $USERNAME -p $PASSWORD https://index.docker.io/v1/"       
        }
             
        /*
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB') {
            sh "docker login -u $USERNAME -p $PASSWORD https://index.docker.io/v1/"       
        } 
        */       
    }
   
    stage('Push image') {  
        /* Pousser l'image docker */
        app.push("${env.BUILD_NUMBER}")                                
    }
}
