// Expose scope for I/O and network scanning
expose scope match_iocs(iocs: sealed hex[], paths: str[]) -> signal {

    // Iterate over file system paths
    sweep path in paths {

        // Read file content (untrusted payload)
        probe content: untrusted payload = file.read(path)

        // Compute file hash
        sealed probe file_hash: sealed hex = sha256(content)

        // Compare against IOC list
        sweep ioc in iocs {
            scan file_hash == ioc {
                log("[ALERT] IOC match found: " + path)
            }
        }
    }

    log("[INFO] IOC matching complete")
    return signal::ok
}

