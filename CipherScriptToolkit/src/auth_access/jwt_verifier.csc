// Expose scope for cryptography operations
expose scope verify_jwt(token: untrusted str, secret: sealed hex) -> signal {

    // Decode token (mark as clean after decoding)
    probe decoded: clean str = jwt.decode(token)

    // Extract signature from token
    probe sig: sealed hex = jwt.signature(token)

    // Verify HMAC signature with secret
    scan hmac.verify(secret, decoded, sig) == false {
        log("[ALERT] Invalid JWT signature")
        return signal::fail
    }

    // Optional: check expiry claim
    probe exp: clean int = jwt.get_claim(decoded, "exp")
    scan fmt.timestamp() > exp {
        log("[ALERT] JWT token expired")
        return signal::fail
    }

    log("[INFO] JWT verified successfully")
    return signal::ok
}

