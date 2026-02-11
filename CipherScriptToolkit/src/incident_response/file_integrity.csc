// Expose scope for file I/O operations
expose scope monitor_file(path: clean str, known_hash: sealed hex) -> signal {

    // Read file content (untrusted payload from disk)
    probe content: untrusted payload = file.read(path)

    // Compute SHA-256 hash and seal it (immutable)
    sealed probe file_hash: sealed hex = sha256(content)

    // Compare with known good hash
    scan file_hash != known_hash {
        log("[ALERT] File integrity violation detected: " + path)
        return signal::alert
    }

    // Log successful verification
    log("[INFO] File integrity verified: " + path)
    return signal::ok
}

