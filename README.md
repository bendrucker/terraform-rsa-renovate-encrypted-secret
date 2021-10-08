# terraform-rsa-renovate-encrypted-secret [![terraform module](https://img.shields.io/badge/terraform-module-623CE4)](https://registry.terraform.io/modules/bendrucker/renovate-encrypted-secret/rsa)

> Terraform module for encrypting secrets for Renovate

**Deprecated:** Replaced by [terraform-gpg-renovate-encrypted-secret](https://github.com/bendrucker/terraform-gpg-renovate-encrypted-secret). [Renovate now uses GPG encryption](https://github.com/renovatebot/renovate/pull/11673) and includes organization/repository scopes in the encrypted payload. GPG encryption also removes the plaintext size limitation imposed by RSA. While hosted Renovate continues to support RSA-encrypted secrets, users may be required to move to GPG in the future.

<hr>

[Renovate](https://github.com/renovatebot/renovate) is a tool for automatically updating dependencies in your projects, similar to [GitHub Dependabot](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/about-dependabot-version-updates). As a native service, Dependabot has its own built-in category of GitHub organization secrets for [accessing private registries](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/configuration-options-for-dependency-updates#configuration-options-for-private-registries). Renovate, as a third party GitHub app, [cannot rely on GitHub for secret storage](https://docs.renovatebot.com/private-modules/#access-to-github-actions-secrets). Instead, Renovate allows users to [encrypt secrets](https://docs.renovatebot.com/private-modules/#encrypting-secrets) using Renovate's public key and include the encrypted value in the Renovate configuration. Renovate's servers hold the private key and can decrypt the original plaintext value.

This module performs the same public key encryption as [app.renovatebot.com/encrypt](https://app.renovatebot.com/encrypt), enabling secure and fully automated secret management for Renovate, using Terraform. 
