1)Docker should be installed. You can verify your Docker Instalation via: $ docker --version
2)Terraform should be installed. You can verify your Terraform Instalation via: $ terraform -help
3)Creating the Project Directory and the Subdirectory 'src' that contains the Flask App code.
4)Creating the Dockerfile
  Building the Image via: $ docker build -t pure_image:latest .
  Verifying the Docker Image Building via: $ docker images
5)Deployment of Docker Image with Terraform
  Initialize Terraform via: $ terraform init
  Plan the Deployment via: $ terraform plan
  Apply the Configuration (Deploy) via: $ terraform apply
  Verify Deployment via going to link http://127.0.0.1:5001 









