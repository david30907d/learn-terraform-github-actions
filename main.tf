# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
terraform {
  required_providers {
    google = {
      version = "~> 4.51.0"
    }
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "4.52.0"
    # }
    # random = {
    #   source  = "hashicorp/random"
    #   version = "3.4.3"
    # }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "example-org-d63b9a"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

# provider "aws" {
#   region = "us-west-2"
# }

# resource "random_pet" "sg" {}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

provider "google" {
  project = "cashcow-test-for-migration"
}

resource "google_redis_instance" "my_memorystore_redis_instance" {
  name           = "cashcow-redis"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = "asia-east1"
  redis_version  = "REDIS_6_X"
}
