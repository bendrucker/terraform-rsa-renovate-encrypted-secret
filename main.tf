resource "rsa_ciphertext" "encrypted" {
  plaintext  = var.plaintext
  public_key = var.public_key
}
