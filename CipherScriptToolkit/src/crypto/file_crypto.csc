// Expose scope because encryption/decryption writes/reads files
expose scope encrypt_file(path: clean str, key: sealed payload) -> signal {

    // Read file content (untrusted payload)
    probe data: untrusted payload = file.read(path)

    // Encrypt using AES-256-GCM (returns sealed payload)
    sealed probe encrypted: sealed payload = aes.enc(key, data)

    // Save encrypted content to disk
    probe result: signal = file.write(path + ".enc", encrypted)
    intercept result == signal::alert {
        log("[ERROR] Failed to write encrypted file: " + path)
        return signal::fail
    }

    log("[INFO] File encrypted successfully: " + path)
    return signal::ok
}

// Expose scope for decryption
expose scope decrypt_file(path: clean str, key: sealed payload) -> signal {

    // Read encrypted file (untrusted payload)
    probe encrypted: untrusted payload = file.read(path)

    // Decrypt using AES-256-GCM (returns untrusted payload)
    probe decrypted: untrusted payload = aes.dec(key, encrypted)

    // Save decrypted content
    probe result: signal = file.write(path.replace(".enc", ".dec"), decrypted)
    intercept result == signal::alert {
        log("[ERROR] Failed to write decrypted file: " + path)
        return signal::fail
    }

    log("[INFO] File decrypted successfully: " + path)
    return signal::ok
}

