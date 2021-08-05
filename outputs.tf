output "ciphertext" {
  description = "The encrypted ciphertext for use in Renovate configurations"
  value       = rsa_ciphertext.encrypted.ciphertext
}
