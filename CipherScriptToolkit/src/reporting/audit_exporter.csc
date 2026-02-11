// Expose scope because we read logs and write output
expose scope export_audit_logs(log_paths: str[], output_file: clean str, format: clean str) -> signal {

    // Collect all log entries
    probe logs: clean str[] = []

    sweep path in log_paths {
        probe content: untrusted payload = file.read(path)
        probe lines: clean str[] = split(fmt.json(content), "\n")
        sweep line in lines { logs += line }
    }

    // Serialize to requested format
    probe serialized: clean str = scan format == "csv" ? fmt.csv(logs) : fmt.json(logs)

    // Write exported logs
    probe result: signal = file.write(output_file, serialized)
    intercept result == signal::alert {
        log("[ERROR] Failed to export audit logs")
        return signal::fail
    }

    log("[INFO] Audit logs exported successfully to " + output_file)
    return signal::ok
}

