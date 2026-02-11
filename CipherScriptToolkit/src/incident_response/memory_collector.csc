// Expose scope for memory I/O
expose scope collect_memory_artifact(proc_name: clean str) -> signal {

    // Capture process memory (untrusted payload)
    probe mem_dump: untrusted payload = memory.capture(proc_name)

    // Seal memory dump hash for tamper-evidence
    sealed probe mem_hash: sealed hex = sha256(mem_dump)

    // Save artifact to disk
    probe result: signal = file.write("/artifacts/" + proc_name + ".dump", mem_dump)
    intercept result == signal::alert {
        log("[ERROR] Failed to write memory artifact: " + proc_name)
        return signal::fail
    }

    log("[INFO] Memory artifact collected for " + proc_name)
    log("[INFO] Tamper-evident hash: " + mem_hash)
    return signal::ok
}

