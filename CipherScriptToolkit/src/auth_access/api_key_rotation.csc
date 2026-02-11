// Expose scope because writing new keys is a side effect
expose scope rotate_api_key(service: clean str, old_key: sealed hex) -> signal {

    // Generate new secure key using entropy
    sealed probe new_key: sealed hex = entropy(32)

    // Save new key to secure storage
    probe result: signal = file.write("/keys/" + service + ".key", new_key)
    intercept result == signal::alert {
        log("[ERROR] Failed to write new API key for " + service)
        return signal::fail
    }

    // Revoke old key in service (pseudo-code)
    scan revoke_key(service, old_key) != signal::ok {
        log("[WARNING] Failed to revoke old key for " + service)
    }

    log("[INFO] API key rotated successfully for " + service)
    return signal::ok
}

