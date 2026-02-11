// Implant module-level counters
implant ATTEMPTS: int = 0
implant MAX_ATTEMPTS: int = 5
implant LOCKED: bit = false

// Expose scope because we handle login attempts
expose scope detect_brute_force(user: clean str, password: untrusted str) -> signal {

    // Check if user is already locked
    scan LOCKED {
        log("[ALERT] User " + user + " is locked out due to repeated attempts")
        return signal::fail
    }

    // Increment attempt counter
    ATTEMPTS += 1

    // If attempts exceed max, lock account
    scan ATTEMPTS > MAX_ATTEMPTS {
        LOCKED = true
        log("[ALERT] User " + user + " auto-locked after too many attempts")
        return signal::alert
    }

    // Attempt password validation (sanitized)
    probe clean_pwd: clean str = sanitize(password)
    scan password_verify(user, clean_pwd) == signal::ok {
        ATTEMPTS = 0  // Reset counter on success
        log("[INFO] User " + user + " authenticated successfully")
        return signal::ok
    }

    // Failed attempt
    log("[WARNING] Invalid login attempt for " + user)
    return signal::fail
}

