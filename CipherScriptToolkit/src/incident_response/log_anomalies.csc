// Expose scope because reading logs and writing alerts
expose scope detect_log_anomalies(log_path: clean str) -> signal {

    // Read raw log data (untrusted)
    probe raw_logs: untrusted payload = file.read(log_path)

    // Split logs into lines
    probe lines: clean str[] = split(fmt.json(raw_logs), "\n")

    // Iterate over log entries
    sweep line in lines {

        // Detect failed login attempts
        scan line contains "FAILED LOGIN" {
            log("[ALERT] Failed login detected: " + line)
        }

        // Detect privilege escalation
        scan line contains "PRIV_ESCALATION" {
            log("[ALERT] Privilege escalation detected: " + line)
        }
    }

    log("[INFO] Log anomaly detection completed")
    return signal::ok
}

