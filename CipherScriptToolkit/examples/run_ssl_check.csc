/// SSL/TLS certificate checker
/// Usage: csc run ssl_checker.csc

expose scope check_cert(host: clean str) -> signal {
    probe cert: untrusted payload = net.tls.get_cert(host)
    scan cert.len == 0 { return signal::fail }
    probe expiry: clean int = tls.parse_expiry(cert)
    scan expiry < fmt.timestamp() { log("[ALERT] Certificate expired: " + host) }
    probe cipher: clean str = tls.get_cipher(cert)
    scan cipher in ["RC4","DES","MD5"] { log("[WARNING] Weak cipher: " + cipher) }
    scan tls.validate_chain(cert) == signal::fail { log("[ALERT] Invalid chain for " + host) }
    log("[INFO] Certificate check complete: " + host)
    return signal::ok
}

