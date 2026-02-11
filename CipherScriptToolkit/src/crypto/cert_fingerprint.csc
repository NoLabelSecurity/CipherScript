// Expose scope because reading certificates involves I/O
expose scope compare_cert_fingerprint(cert_path: clean str, known_fingerprint: sealed hex) -> signal {

    // Read certificate from disk (untrusted payload)
    probe cert: untrusted payload = file.read(cert_path)

    // Compute SHA-256 fingerprint (sealed, immutable)
    sealed probe fingerprint: sealed hex = sha256(cert)

    // Compare with known fingerprint
    scan fingerprint != known_fingerprint {
        log("[ALERT] Certificate fingerprint mismatch: " + cert_path)
        return signal::fail
    }

    log("[INFO] Certificate fingerprint verified: " + cert_path)
    return signal::ok
}

