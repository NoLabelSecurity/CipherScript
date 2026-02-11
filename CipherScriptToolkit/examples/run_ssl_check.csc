// Example usage of SSL/TLS checker
probe hosts: clean str[] = ["example.com", "192.168.1.1"]

sweep h in hosts {
    scan check_cert(h) != signal::ok {
        emit("[ERROR] SSL check failed for " + h)
    } pivot {
        emit("[INFO] SSL check passed for " + h)
    }
}


