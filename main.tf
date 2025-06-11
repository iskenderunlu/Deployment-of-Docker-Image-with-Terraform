# Specifying Docker provider

terraform {

  required_providers {

    docker = {

      source = "kreuzwerker/docker"

      version = "3.0.2"

    }

  }

}

# Define the Docker container data source

 resource "docker_image" "local_image" {

  name = "pure_image:latest"

  build {
    context    = "."
    dockerfile = "./dockerfile"
  }

}

# Define the Docker container resource

resource "docker_container" "pure_app" {

  name = "pure_app"

  image = resource.docker_image.local_image.name
  
  must_run = true

  # Expose port 5000 for Flask app

  ports {

    internal = 5001

    external = 5001

  }

}

# Terraform provisioner to wait for container to be ready

resource "null_resource" "wait_for_container" {

  depends_on = [docker_container.pure_app]

  # Local-exec provisioner to wait for container to be ready

  provisioner "local-exec" {

    command = "sleep 15"

  }

}