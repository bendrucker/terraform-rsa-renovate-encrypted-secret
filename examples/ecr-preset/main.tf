resource "aws_ecr_repository" "ecr" {
  name = "docker"
}

resource "aws_ecr_repository_policy" "ecr" {
  repository = aws_ecr_repository.ecr.name
  policy = data.aws_iam_policy_document.ecr.json
}

data "aws_iam_policy_document" "ecr" {
  statement {
    actions = [
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
    ]
    
    principals {
      aws = aws_iam_user.renovate.arn
    }
  }
}

resource "aws_iam_user" "renovate" {
  name = "renovate"
}


resource "aws_iam_access_key" "renovate" {
  user    = aws_iam_user.renovate.name
}

module "encrypted_secret" {
  source = "../.."

  plaintext = aws_iam_access_key.renovate.secret
}

resource "github_repository" "presets" {
  name      = "renovate-presets"
}

locals {
  preset_name = "ecr"
}

resource "github_repository_file" "preset" {
   repository = github_repository.presets.name
   branch     = github_repository.presets.default_branch
   file       = "${local.preset_name}.json"

   content = jsonencode({
     hostRules = [{
       hostType = "docker"
       matchHost = aws_ecr_repository.ecr.repository_url
       username  = aws_iam_access_key.renovate.user
       encrypted = {
         password = module.encrypted_secret.ciphertext
       }
     }]
   })

   commit_author  = "Terraform"
   commit_email   = "terraform@example.com"
   commit_message = "Update ECR preset"
}

output "preset" {
  value = "github>${github_repository.presets.full_name}:${local.preset_name}"
  description = "Include this value in the 'extends' array in your Renovate configuration for access to pull from the ECR repo"
}
