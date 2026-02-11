// Expose scope because we might log and process sensitive input
expose scope audit_password_strength(pwd: untrusted str) -> signal {

    // Sanitize input and mark as clean
    probe clean_pwd: clean str = sanitize(pwd)

    // Compute password entropy using built-in function
    probe entropy_score: clean int = password.entropy(clean_pwd)

    // Check if entropy is below recommended threshold
    scan entropy_score < 50 {
        log("[WARNING] Weak password detected (entropy=" + entropy_score + ")")
        return signal::fail
    }

    // Log strong password
    log("[INFO] Password meets strength requirements (entropy=" + entropy_score + ")")
    return signal::ok
}

