// Expose scope because cryptography involves side effects
expose scope hmac_pipeline(message: untrusted payload, key: sealed payload) -> sealed hex {

    // Compute HMAC of the message
    sealed probe tag: sealed hex = hmac(key, message)

    // Log creation of authentication tag
    log("[INFO] HMAC tag generated")

    return tag
}

// Verify HMAC
expose scope verify_hmac(message: untrusted payload, key: sealed payload, tag: sealed hex) -> signal {

    // Verify HMAC tag
    scan hmac.verify(key, message, tag) == false {
        log("[ALERT] HMAC verification failed")
        return signal::fail
    }

    log("[INFO] HMAC verification succeeded")
    return signal::ok
}

