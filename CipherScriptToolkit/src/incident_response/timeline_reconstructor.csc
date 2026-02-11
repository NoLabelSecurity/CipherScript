// Expose scope because we read multiple audit logs
expose scope reconstruct_timeline(log_paths: str[]) -> signal {

    // Create empty list of timeline events
    probe timeline: clean str[] = []

    // Iterate over each audit log
    sweep path in log_paths {

        // Read log file (untrusted payload)
        probe logs: untrusted payload = file.read(path)

        // Split into entries and append to timeline
        probe entries: clean str[] = split(fmt.json(logs), "\n")
        sweep e in entries { timeline += e }
    }

    // Sort timeline (assuming ISO-8601 timestamps)
    timeline.sort()

    // Output timeline
    emit("[INFO] Reconstructed Timeline:")
    sweep event in timeline { emit(event) }

    log("[INFO] Timeline reconstruction complete")
    return signal::ok
}
