// Expose scope for hashing passwords
expose scope hash_password(pwd: untrusted str, salt: sealed payload) -> sealed hex {

    // Sanitize and mark password as clean
    probe clean_pwd: clean str = sanitize(pwd)

    // Compute Argon2id hash
    sealed probe hashed: sealed hex = argon2(clean_pwd, salt)

    log("[INFO] Password hashed securely")
    return hashed
}

// Verify password against Argon2 hash
expose scope verify_password(pwd: untrusted str, salt: sealed payload, hash: sealed hex) -> signal {

    probe clean_pwd: clean str = sanitize(pwd)
    sealed probe computed: sealed hex = argon2(clean_pwd, salt)

    // Compare computed hash with stored hash
    scan computed != hash {
        log("[ALERT] Password verification failed")
        return signal::fail
    }

    log("[INFO] Password verified successfully")
    return signal::ok
}
