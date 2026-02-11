// Expose scope because generating secrets is security-sensitive
expose scope generate_secret(length: int) -> sealed payload {

    // Generate cryptographically secure random bytes
    sealed probe secret: sealed payload = entropy(length)

    // Optional: compute entropy score to ensure randomness quality
    probe score: clean int = password.entropy(fmt.base64.enc(secret))
    scan score < 128 {
        log("[WARNING] Generated secret may be weak (entropy=" + score + ")")
    }

    log("[INFO] Secure secret generated")
    return secret
}

