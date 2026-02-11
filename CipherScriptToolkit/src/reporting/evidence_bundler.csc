// Expose scope because we bundle files
expose scope bundle_evidence(files: str[], bundle_path: clean str) -> signal {

    // Start empty archive (simplified for illustration)
    probe archive: untrusted payload = []

    // Sweep over files to include
    sweep f in files {

        // Read file (untrusted)
        probe content: untrusted payload = file.read(f)
        archive += content

        // Compute and log sealed SHA-256 for chain-of-custody
        sealed probe hash: sealed hex = sha256(content)
        log("[INFO] File included: " + f + " | hash: " + hash)
    }

    // Save bundle
    probe result: signal = file.write(bundle_path, archive)
    intercept result == signal::alert {
        log("[ERROR] Failed to write evidence bundle")
        return signal::fail
    }

    log("[INFO] Evidence package created: " + bundle_path)
    return signal::ok
}
