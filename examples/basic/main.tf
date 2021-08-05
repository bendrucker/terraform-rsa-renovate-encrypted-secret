module "renovate_encrypted" {
  source = "../.."

  plaintext = "super secret"
}

output "encrypted" {
  value = module.renovate_encrypted.ciphertext
}
