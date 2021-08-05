This is a complex example that creates:

* A new private registry (Amazon ECR repository)
* An identity (IAM user) and credentials for Renovate
* A Renovate preset, in GitHub, with the necessary `hostRules`, including the encrypted password

It outputs the Renovate preset path, which you can include in your `renovate.json` file for any repository that uses images from the ECR repository.
