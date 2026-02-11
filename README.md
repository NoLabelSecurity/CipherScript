# CipherScript
A security automation suite with modules for vulnerability assessment, incident response, auth, crypto, and reporting. Developed with ClaudeAI to generate secure, well-commented CipherScript code, examples, and documentation. Save the HTML file, open in browser.


<section id="builtins">
      <h2>Built-in Functions</h2>
      <table class="ref-table">
        <tr><th>Function</th><th>Category</th><th>Description</th></tr>
        <tr><td>sha256(d)</td><td><span class="chip chip-cyan">crypto</span></td><td>SHA-256 hash of a payload</td></tr>
        <tr><td>md5(d)</td><td><span class="chip chip-cyan">crypto</span></td><td>MD5 hash (legacy — compiler issues warning)</td></tr>
        <tr><td>base64.enc(d)</td><td><span class="chip chip-cyan">crypto</span></td><td>Base64 encode a payload</td></tr>
        <tr><td>base64.dec(s)</td><td><span class="chip chip-cyan">crypto</span></td><td>Base64 decode a string to payload</td></tr>
        <tr><td>validate(v)</td><td><span class="chip chip-yellow">trust</span></td><td>Run trust validation; returns bit</td></tr>
        <tr><td>sanitize(v)</td><td><span class="chip chip-yellow">trust</span></td><td>Strip dangerous chars; returns clean str</td></tr>
        <tr><td>net.connect(h, p)</td><td><span class="chip chip-red">network</span></td><td>TCP connect; returns signal</td></tr>
        <tr><td>net.recv()</td><td><span class="chip chip-red">network</span></td><td>Receive bytes; returns untrusted payload</td></tr>
        <tr><td>net.send(d)</td><td><span class="chip chip-red">network</span></td><td>Send payload; requires expose scope</td></tr>
        <tr><td>file.read(p)</td><td><span class="chip chip-purple">io</span></td><td>Read file; returns untrusted payload</td></tr>
        <tr><td>file.write(p, d)</td><td><span class="chip chip-purple">io</span></td><td>Write file; requires expose scope</td></tr>
        <tr><td>log(msg)</td><td><span class="chip chip-purple">io</span></td><td>Append to audit log; always available</td></tr>
        <tr><td>entropy(n)</td><td><span class="chip chip-cyan">crypto</span></td><td>Generate n cryptographic random bytes</td></tr>
        <tr><td>cidr.parse(s)</td><td><span class="chip chip-red">network</span></td><td>Parse CIDR notation to address range</td></tr>
        <tr><td>hex.dump(d)</td><td><span class="chip chip-yellow">debug</span></td><td>Pretty-print payload as hex dump</td></tr>
      </table>
    </section>
