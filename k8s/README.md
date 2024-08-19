# Minikube Setup and Yolomy eCommerce Deployment Documentation
This documentation provides step-by-step instructions to install Minikube, start it, and deploy the Yolomy eCommerce website using `kubectl`.

## Table of Contents
1. Prerequisites
2. Install Minikube
3. Start Minikube
4. Deploy Yolomy eCommerce Website
5. Accessing the Yolomy Application
6. Stopping and Deleting Minikube

## Prerequisites
Before you begin, ensure you have the following installed:

-   **Virtualization**: Enable virtualization in your BIOS/UEFI settings.
-   **kubectl**: The Kubernetes command-line tool. Install it from [Kubernetes Official Documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
-   **Minikube**: Follow the installation instructions below.

## Install Minikube

1.  **Download Minikube**:
    
   -   For macOS:
        
		    brew install minikube` 
        
    -   For Windows:  
        Download the latest installer from the [Minikube Releases](https://github.com/kubernetes/minikube/releases) page.
    -   For Linux:
        
        	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        	sudo install minikube-linux-amd64 /usr/local/bin/minikube` 
        
2.  **Verify Installation**:
    
		minikube version` 
    
## Start Minikube
1.  **Start the Minikube Cluster**:
    
	    minikube start` 
2.  **Verify Minikube Status**:
    
	    minikube status` 

## Deploy Yolomy eCommerce Website
  
1.  **Create a Namespace (Optional)**:  
    You can deploy your application in a specific namespace.
    
	    kubectl create namespace yolomy` 
    
2.  **Deploy the Application**:  
    Apply the Kubernetes deployments and services:
    
	    kubectl apply -f deployment.yaml --namespace yolomy
	    kubectl apply -f service.yaml --namespace yolomy` 

Sample deployment.yaml

        apiVersion: apps/v1
        kind: Deployment
        metadata:
        name: yolomy-deployment
        namespace: yolomy		
        spec:
        replicas: 3 	#This covers the number of pod replicas you want
        selector:
        matchLabels:
          app: yolomy #Name should match the NameSpace always for ease
        template:
        metadata:
          labels:
            app: yolomy
        spec:
          containers:
          - name: yolomy
            image: docker.io/yolomy/ecommerce:latest # Replace with the correct image for docker image or image from compose.yaml with docker compose up
            ports:
            - containerPort: 80
            env:	#Hint: to help you with the connection to database
            - name: DATABASE_URL
              value: "mongodb://mongo:27017/yolomy" # Adjust based on your setup
            - name: NODE_ENV
              value: "production"

Sample service.yaml

    apiVersion: v1
    kind: Service
    metadata:
      name: yolomy-service
      namespace: yolomy  #Similar to the namespace in the deployment
    spec:
      type: NodePort/LoadBalancer
      selector:
        app: yolomy
      ports:
        - port: 80
          targetPort: 80
          nodePort: 30001 # Choose a port in the range 30000-32767

Save these configurations in their respective .yaml files, and then you can apply them using kubectl as mentioned in the previous instructions.

3.  **Check the Deployment**:
    
	    kubectl get pods --namespace yolomy` 
    
4.  **Expose the Application**:  
    If the service type is set to `NodePort`, you can access it via Minikube's IP:
    
	    minikube service <service-name> --namespace yolomy` 

	Replace **service-name** with the actual service name defined in `service.yaml`.
    

## Accessing the Yolomy Application

After exposing the service, you should see a URL in the terminal. Open the URL in your browser to access the Yolomy eCommerce website.

## Stopping and Deleting Minikube

1.  **Stop Minikube**:
    
	    minikube stop` 
    
2.  **Delete Minikube**:
    
	    minikube delete` 
    

## Conclusion
You have successfully installed Minikube, started it, and deployed the Yolomy eCommerce website using `kubectl`. For further customization and development, refer to the [Kubernetes documentation](https://kubernetes.io/docs/home/) and the Yolomy repository for specific application configurations.

If you encounter any issues, please consult the respective project documentation or community forums for assistance. Happy deploying!
