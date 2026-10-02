terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = " ~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true 
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.image_id
  name  = "miser2-terraform"

  ports {
    internal = 80
    external = 8081
  }
}
