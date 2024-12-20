
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }
  }
}

provider "github" {
  # Use a variable for the GitHub token
  token = var.github_token
}

resource "github_repository" "MyRepo" {
  name        = "repo-created-using-terraform"
  visibility  = "public"
  description = "This repo is created using terraform"
}
