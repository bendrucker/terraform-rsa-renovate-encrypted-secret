variable "plaintext" {
  type = string
}

module "renovate_encrypted" {
  source = "../.."

  plaintext = var.plaintext
}

output "encrypted" {
  value = module.renovate_encrypted.ciphertext
}
