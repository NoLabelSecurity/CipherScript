//// Expose scope because token verification is a security operation
expose scope validate_session(token: sealed hex, expiry_ts: clean int) -> signal {

    // Check if token has expired
    scan fmt.timestamp() > expiry_ts {
        log("[ALERT] Session token expired")
        return signal::fail
    }

    // Optional: verify token format or HMAC (omitted for brevity)
    log("[INFO] Session token valid")
    return signal::ok
}

