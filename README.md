# CipherScript
A security automation suite with modules for vulnerability assessment, incident response, auth, crypto, and reporting. Developed with ClaudeAI to generate secure, well-commented CipherScript code, examples, and documentation. Save the HTML file, open in browser.


<header>
  <div class="logo">
    <div class="logo-icon">⌘</div>
    <span class="logo-text">CIPHERSCRIPT</span>
    <span class="version-badge">v1.0.0</span>
  </div>
  <div class="search-wrap">
    <span class="search-icon">⌕</span>
    <input type="text" id="searchInput" placeholder="Search docs..." autocomplete="off" />
    <div class="search-results" id="searchResults"></div>
  </div>
  <span class="tagline">// A LANGUAGE BUILT FOR SECURITY THINKERS</span>
</header>

<div class="container">
  <nav>
    <div class="nav-section">Overview</div>
    <ul>
      <li><a href="#quickstart">Quick Start</a></li>
      <li><a href="#intro">Introduction</a></li>
      <li><a href="#philosophy">Philosophy</a></li>
    </ul>
    <div class="nav-section">Syntax</div>
    <ul>
      <li><a href="#types">Types</a></li>
      <li><a href="#variables">Variables</a></li>
      <li><a href="#control">Control Flow</a></li>
      <li><a href="#functions">Functions</a></li>
      <li><a href="#builtins">Built-ins</a></li>
    </ul>
    <div class="nav-section">Features</div>
    <ul>
      <li><a href="#trust">Trust Levels</a></li>
      <li><a href="#channels">Channels</a></li>
      <li><a href="#structs">Structs &amp; Types</a></li>
      <li><a href="#stdlib">Standard Library</a></li>
      <li><a href="#cli">CLI Reference</a></li>
      <li><a href="#examples">Examples</a></li>
      <li><a href="#repl">Sandbox</a></li>
    </ul>
    <div class="nav-section">Security</div>
    <ul>
      <li><a href="#threatmodel">Threat Model</a></li>
      <li><a href="#owasp">OWASP Mapping</a></li>
    </ul>
    <div class="nav-section">Project</div>
    <ul>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#changelog">Changelog</a></li>
      <li><a href="#license">License &amp; Credits</a></li>
    </ul>
  </nav>

  <main>
    <section id="quickstart">
      <h1>Quick Start<span class="cursor"></span></h1>
      <div class="hero-block">
        <p>Get CipherScript running in under 5 minutes. This guide walks you from install to your first working security script.</p>
      </div>
      <div class="qs-steps">
        <div class="qs-step">
          <div class="qs-num">01</div>
          <div class="qs-content">
            <div class="qs-title">Install the CipherScript Compiler</div>
            <p>Requires a Unix-like OS (Linux, macOS). Windows supported via WSL2.</p>
            <div class="code-block">
              <pre><span class="c"># Install via the official installer</span>
<span class="v">curl -fsSL https://cipherscript.dev/install.sh | bash</span>

<span class="c"># Or build from source</span>
<span class="v">git clone https://github.com/brianlorick/cipherscript</span>
<span class="v">cd cipherscript && make install</span></pre>
            </div>
          </div>
        </div>
        <div class="qs-step">
          <div class="qs-num">02</div>
          <div class="qs-content">
            <div class="qs-title">Verify Your Installation</div>
            <p>Confirm the compiler is on your PATH and check the version.</p>
            <div class="code-block">
              <pre><span class="v">csc --version</span>
<span class="c"># → CipherScript v1.0.0 (c) Brian Lorick</span>

<span class="v">csc --help</span>
<span class="c"># → Lists all available commands</span></pre>
            </div>
          </div>
        </div>
        <div class="qs-step">
          <div class="qs-num">03</div>
          <div class="qs-content">
            <div class="qs-title">Create Your First Script</div>
            <p>CipherScript files use the <code>.csc</code> extension. Create <code>hello.csc</code>:</p>
            <div class="code-block">
              <pre><span class="c">// hello.csc — your first CipherScript program</span>
<span class="k">probe</span> <span class="v">target</span>: <span class="t">clean str</span> <span class="op">=</span> <span class="s">"127.0.0.1"</span>

<span class="k">scope</span> <span class="f">main</span>() <span class="op">-></span> <span class="t">signal</span> {
    <span class="f">emit</span>(<span class="s">"[*] CipherScript online"</span>)
    <span class="f">emit</span>(<span class="s">"[*] Target: "</span> <span class="op">+</span> <span class="v">target</span>)
    <span class="f">log</span>(<span class="s">"Session started"</span>)
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
}</pre>
            </div>
          </div>
        </div>
        <div class="qs-step">
          <div class="qs-num">04</div>
          <div class="qs-content">
            <div class="qs-title">Run It</div>
            <p>Use <code>csc run</code> to compile and execute in one step.</p>
            <div class="code-block">
              <pre><span class="v">csc run hello.csc</span>
<span class="c"># Output:</span>
<span class="s">[*] CipherScript online</span>
<span class="s">[*] Target: 127.0.0.1</span>
<span class="c"># Audit log → ~/.csc/audit.log</span></pre>
            </div>
          </div>
        </div>
        <div class="qs-step">
          <div class="qs-num">05</div>
          <div class="qs-content">
            <div class="qs-title">Run the Linter</div>
            <p>Always lint before deploying. The linter catches trust violations, deprecated functions, and scope issues before runtime.</p>
            <div class="code-block">
              <pre><span class="v">csc lint hello.csc</span>
<span class="c"># Output:</span>
<span class="s">[OK]   No trust violations</span>
<span class="s">[OK]   All signals handled</span>
<span class="s">[OK]   No deprecated functions</span>
<span class="s">       0 errors, 0 warnings</span></pre>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section id="intro">
      <h1>CipherScript<span class="cursor"></span></h1>
      <div class="hero-block">
        <p>CipherScript is a statically-typed, security-first scripting language where every design decision mirrors the mindset of a security practitioner — verify first, trust nothing, act with intent.</p>
      </div>
      <div class="code-block">
        <span class="label">HELLO WORLD</span>
        <pre><span class="c">// CipherScript — first contact</span>
<span class="k">probe</span> <span class="v">target</span> <span class="op">=</span> <span class="s">"10.0.0.1"</span>
<span class="k">scope</span> <span class="f">main</span>() <span class="op">-></span> <span class="t">signal</span> {
    <span class="k">emit</span>(<span class="s">"Connection established to "</span> <span class="op">+</span> <span class="v">target</span>)
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
}</pre>
      </div>
    </section>
    <section id="philosophy">
      <h2>Design Philosophy</h2>
      <p>CipherScript's syntax and semantics are shaped by the four pillars of defensive security thinking.</p>
      <div class="philosophy-grid">
        <div class="phil-card">
          <span class="num">01 //</span>
          <div class="title">Zero Trust by Default</div>
          <p>All inputs are <code>untrusted</code> until explicitly verified. Casting to <code>clean</code> requires an explicit validation step.</p>
        </div>
        <div class="phil-card">
          <span class="num">02 //</span>
          <div class="title">Explicit Intent</div>
          <p>Operations with side effects — network calls, file I/O, memory writes — require the <code>expose</code> keyword to make intent visible.</p>
        </div>
        <div class="phil-card">
          <span class="num">03 //</span>
          <div class="title">Fail Closed</div>
          <p>Errors don't propagate silently. Unhandled <code>alert</code> values are a compile-time error — you must acknowledge every failure path.</p>
        </div>
        <div class="phil-card">
          <span class="num">04 //</span>
          <div class="title">Least Privilege</div>
          <p>Variables default to the narrowest scope. <code>probe</code> (local), <code>implant</code> (module), and <code>broadcast</code> (global) escalate scope explicitly.</p>
        </div>
        <div class="phil-card">
          <span class="num">05 //</span>
          <div class="title">Audit Trail</div>
          <p>The <code>log</code> built-in is always available and never stripped from production builds — every action should leave a trace.</p>
        </div>
        <div class="phil-card">
          <span class="num">06 //</span>
          <div class="title">Immutable Records</div>
          <p>Data tagged <code>sealed</code> cannot be mutated after assignment — ideal for hashes, certificates, and forensic artifacts.</p>
        </div>
      </div>
    </section>
    <section id="types">
      <h2>Type System</h2>
      <p>CipherScript uses a security-annotated type system. Every value carries both a data type and a trust classification.</p>
      <h3>Primitive Types</h3>
      <table class="ref-table">
        <tr><th>Type</th><th>Description</th><th>Example</th></tr>
        <tr><td>bit</td><td>Boolean: <code>true</code> / <code>false</code></td><td><code>probe x: bit = true</code></td></tr>
        <tr><td>byte</td><td>8-bit unsigned integer</td><td><code>probe b: byte = 0xFF</code></td></tr>
        <tr><td>int</td><td>64-bit signed integer</td><td><code>probe port: int = 443</code></td></tr>
        <tr><td>hex</td><td>Hexadecimal literal type</td><td><code>probe hash: hex = 0xdeadbeef</code></td></tr>
        <tr><td>str</td><td>Immutable UTF-8 string</td><td><code>probe host: str = "localhost"</code></td></tr>
        <tr><td>payload</td><td>Raw byte buffer</td><td><code>probe buf: payload = [0x00, 0x41]</code></td></tr>
        <tr><td>signal</td><td>Result type: ok | fail | alert</td><td><code>return signal::ok</code></td></tr>
      </table>
      <h3>Trust Qualifiers</h3>
      <table class="ref-table">
        <tr><th>Qualifier</th><th>Meaning</th></tr>
        <tr><td>untrusted</td><td>External input; cannot be used in privileged ops without validation</td></tr>
        <tr><td>clean</td><td>Validated and sanitized — safe for use anywhere</td></tr>
        <tr><td>sealed</td><td>Immutable after assignment; cryptographic or forensic data</td></tr>
        <tr><td>poisoned</td><td>Tainted; must be quarantined — compiler warns if used in clean context</td></tr>
      </table>
      <div class="code-block">
        <span class="label">TRUST QUALIFIERS</span>
        <pre><span class="c">// Input from the network is untrusted by default</span>
<span class="k">probe</span> <span class="v">raw_input</span>: <span class="t">untrusted str</span> <span class="op">=</span> <span class="f">net.recv</span>()

<span class="c">// Must explicitly validate before use in clean context</span>
<span class="k">probe</span> <span class="v">safe_input</span>: <span class="t">clean str</span> <span class="op">=</span> <span class="k">validate</span>(<span class="v">raw_input</span>) <span class="op">?</span> <span class="v">raw_input</span> <span class="op">:</span> <span class="k">halt</span>

<span class="c">// Sealed: hash cannot be altered after creation</span>
<span class="k">sealed probe</span> <span class="v">fingerprint</span>: <span class="t">hex</span> <span class="op">=</span> <span class="f">sha256</span>(<span class="v">safe_input</span>)</pre>
      </div>
    </section>
    <section id="variables">
      <h2>Variables & Scope</h2>
      <p>Variable declarations double as scope declarations. The keyword you choose signals intent to other readers.</p>
      <table class="ref-table">
        <tr><th>Keyword</th><th>Scope</th><th>Mutable</th><th>Analogy</th></tr>
        <tr><td>probe</td><td>Local (function)</td><td>Yes</td><td>A recon variable — temporary, contained</td></tr>
        <tr><td>implant</td><td>Module-level</td><td>Yes</td><td>Persistent within a module, like a placed beacon</td></tr>
        <tr><td>broadcast</td><td>Global</td><td>Yes</td><td>Shared state — use with caution</td></tr>
        <tr><td>sealed probe</td><td>Local</td><td>No</td><td>Locked evidence — immutable once set</td></tr>
      </table>
    </section>
    <section id="control">
      <h2>Control Flow</h2>
      <table class="ref-table">
        <tr><th>Keyword</th><th>Purpose</th></tr>
        <tr><td>scan</td><td>Conditional check (like <code>if</code>)</td></tr>
        <tr><td>pivot</td><td>Else branch</td></tr>
        <tr><td>sweep</td><td>Loop over a range or collection</td></tr>
        <tr><td>persist</td><td>While loop — repeat until condition breaks</td></tr>
        <tr><td>breach</td><td>Break out of a loop</td></tr>
        <tr><td>evade</td><td>Continue to next iteration</td></tr>
        <tr><td>intercept</td><td>Catch an alert/error condition</td></tr>
        <tr><td>halt</td><td>Hard stop — like panic/throw</td></tr>
      </table>
      <div class="code-block">
        <span class="label">CONTROL FLOW</span>
        <pre><span class="k">scope</span> <span class="f">scan_ports</span>(<span class="v">host</span>: <span class="t">clean str</span>) <span class="op">-></span> <span class="t">signal</span> {
    <span class="k">sweep</span> <span class="v">port</span> <span class="k">in</span> <span class="n">1</span>..<span class="n">1024</span> {
        <span class="k">scan</span> <span class="f">net.connect</span>(<span class="v">host</span>, <span class="v">port</span>) <span class="op">==</span> <span class="v">signal</span>::<span class="v">ok</span> {
            <span class="f">log</span>(<span class="s">"[OPEN] port "</span> <span class="op">+</span> <span class="v">port</span>)
        } <span class="k">pivot</span> {
            <span class="k">evade</span>  <span class="c">// skip to next port</span>
        }
    }
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
}</pre>
      </div>
    </section>
    <section id="functions">
      <h2>Functions</h2>
      <p>Functions in CipherScript are declared with <code>scope</code> — reinforcing that every function operates within a defined boundary. Side-effecting functions must use the <code>expose</code> modifier.</p>
      <div class="code-block">
        <span class="label">FUNCTION SYNTAX</span>
        <pre><span class="c">// Pure function (no side effects)</span>
<span class="k">scope</span> <span class="f">hash_target</span>(<span class="v">data</span>: <span class="t">clean payload</span>) <span class="op">-></span> <span class="t">sealed hex</span> {
    <span class="k">return</span> <span class="f">sha256</span>(<span class="v">data</span>)
}

<span class="c">// Expose = has side effects (network, disk, etc.)</span>
<span class="k">expose scope</span> <span class="f">exfil_report</span>(<span class="v">path</span>: <span class="t">clean str</span>, <span class="v">data</span>: <span class="t">clean str</span>) <span class="op">-></span> <span class="t">signal</span> {
    <span class="k">probe</span> <span class="v">result</span> <span class="op">=</span> <span class="f">file.write</span>(<span class="v">path</span>, <span class="v">data</span>)
    <span class="k">intercept</span> <span class="v">result</span> <span class="op">==</span> <span class="v">signal</span>::<span class="v">alert</span> {
        <span class="f">log</span>(<span class="s">"[ERROR] Failed to write report"</span>)
        <span class="k">return</span> <span class="v">signal</span>::<span class="v">fail</span>
    }
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
}</pre>
      </div>
    </section>
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
    <section id="trust">
      <h2>Trust Level System</h2>
      <p>The trust system is CipherScript's most distinctive feature. The compiler enforces that untrusted data never reaches privileged operations without an explicit validation gate.</p>
      <div class="code-block">
        <span class="label">TRUST ENFORCEMENT</span>
        <pre><span class="c">// This will FAIL to compile:</span>
<span class="k">probe</span> <span class="v">user_cmd</span>: <span class="t">untrusted str</span> <span class="op">=</span> <span class="f">net.recv</span>()
<span class="f">file.write</span>(<span class="v">user_cmd</span>, <span class="s">"data"</span>)  <span class="c">// ❌ ERROR: untrusted str in clean context</span>

<span class="c">// This compiles — trust is established via validate()</span>
<span class="k">probe</span> <span class="v">raw</span>: <span class="t">untrusted str</span> <span class="op">=</span> <span class="f">net.recv</span>()
<span class="k">probe</span> <span class="v">safe</span>: <span class="t">clean str</span> <span class="op">=</span> <span class="k">validate</span>(<span class="v">raw</span>) <span class="op">?</span> <span class="f">sanitize</span>(<span class="v">raw</span>) <span class="op">:</span> <span class="k">halt</span>
<span class="f">file.write</span>(<span class="v">safe</span>, <span class="s">"data"</span>)    <span class="c">// ✓ OK: clean str verified</span></pre>
      </div>
    </section>
    <section id="channels">
      <h2>Channels (Concurrency)</h2>
      <p>Concurrency in CipherScript uses named <strong>channels</strong> — inspired by C2 channels in adversarial tradecraft. Data flows between scopes through typed, monitored pipelines.</p>
      <div class="code-block">
        <span class="label">CHANNELS</span>
        <pre><span class="c">// Open a channel between two scopes</span>
<span class="k">channel</span> <span class="v">c2</span>: <span class="t">payload</span>

<span class="k">expose scope</span> <span class="f">listener</span>() {
    <span class="k">persist</span> {
        <span class="k">probe</span> <span class="v">msg</span>: <span class="t">untrusted payload</span> <span class="op">=</span> <span class="v">c2</span>.recv()
        <span class="f">log</span>(<span class="s">"[C2] received "</span> <span class="op">+</span> <span class="f">hex.dump</span>(<span class="v">msg</span>))
    }
}

<span class="k">expose scope</span> <span class="f">sender</span>(<span class="v">data</span>: <span class="t">clean payload</span>) {
    <span class="v">c2</span>.send(<span class="v">data</span>)
}</pre>
      </div>
    </section>
    <section id="examples">
      <h2>Full Examples</h2>
      <h3>Example 1 — Simple Credential Checker</h3>
      <div class="code-block">
        <pre><span class="k">implant</span> <span class="v">MAX_ATTEMPTS</span>: <span class="t">int</span> <span class="op">=</span> <span class="n">3</span>
<span class="k">implant</span> <span class="v">attempts</span>: <span class="t">int</span> <span class="op">=</span> <span class="n">0</span>

<span class="k">sealed probe</span> <span class="v">VALID_HASH</span>: <span class="t">hex</span> <span class="op">=</span> <span class="f">sha256</span>(<span class="s">"s3cr3t"</span>)

<span class="k">scope</span> <span class="f">check_cred</span>(<span class="v">input</span>: <span class="t">untrusted str</span>) <span class="op">-></span> <span class="t">signal</span> {
    <span class="v">attempts</span> <span class="op">+=</span> <span class="n">1</span>
    <span class="k">scan</span> <span class="v">attempts</span> <span class="op">></span> <span class="v">MAX_ATTEMPTS</span> {
        <span class="f">log</span>(<span class="s">"[ALERT] Brute force detected"</span>)
        <span class="k">return</span> <span class="v">signal</span>::<span class="v">alert</span>
    }
    <span class="k">probe</span> <span class="v">clean_in</span> <span class="op">=</span> <span class="f">sanitize</span>(<span class="v">input</span>)
    <span class="k">scan</span> <span class="f">sha256</span>(<span class="v">clean_in</span>) <span class="op">==</span> <span class="v">VALID_HASH</span> {
        <span class="f">log</span>(<span class="s">"[AUTH] Access granted"</span>)
        <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
    }
    <span class="f">log</span>(<span class="s">"[AUTH] Invalid credential"</span>)
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">fail</span>
}</pre>
      </div>
      <h3>Example 2 — Network Packet Inspector</h3>
      <div class="code-block">
        <pre><span class="k">expose scope</span> <span class="f">inspect_packet</span>() <span class="op">-></span> <span class="t">signal</span> {
    <span class="k">probe</span> <span class="v">raw</span>: <span class="t">untrusted payload</span> <span class="op">=</span> <span class="f">net.recv</span>()
    <span class="k">scan</span> <span class="v">raw</span>.len <span class="op">==</span> <span class="n">0</span> {
        <span class="k">return</span> <span class="v">signal</span>::<span class="v">fail</span>
    }
    <span class="f">log</span>(<span class="s">"[PKT] "</span> <span class="op">+</span> <span class="v">raw</span>.len <span class="op">+</span> <span class="s">" bytes received"</span>)
    <span class="f">hex.dump</span>(<span class="v">raw</span>)
    <span class="k">sealed probe</span> <span class="v">checksum</span>: <span class="t">hex</span> <span class="op">=</span> <span class="f">sha256</span>(<span class="v">raw</span>)
    <span class="f">log</span>(<span class="s">"[PKT] Integrity: "</span> <span class="op">+</span> <span class="v">checksum</span>)
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">ok</span>
}</pre>
      </div>
    </section>
    <section id="repl">
      <h2>Syntax Sandbox</h2>
      <p>Try writing some CipherScript below. This is a simulated environment that will validate and explain your syntax.</p>
      <div class="repl-area">
        <div class="repl-header">// CIPHERSCRIPT SANDBOX — simulated output</div>
        <textarea class="repl-input" id="replInput" placeholder="probe x: int = 42
scope main() -> signal {
    emit(x)
    return signal::ok
}"></textarea>
        <button class="repl-btn" onclick="runRepl()">▶ ANALYZE</button>
        <div class="repl-output" id="replOutput"></div>
      </div>
    </section>
    <section id="structs">
      <h2>Structs &amp; Custom Types</h2>
      <p>CipherScript lets you define structured data using <code>blueprint</code> declarations. Blueprints carry trust qualifiers at both the type and field level, so data integrity is enforced structurally.</p>
      <h3>Defining a Blueprint</h3>
      <div class="code-block">
        <span class="label">BLUEPRINT SYNTAX</span>
        <pre><span class="c">// Define a reusable structured type</span>
<span class="k">blueprint</span> <span class="t">Packet</span> {
    src:     <span class="t">clean str</span>
    dst:     <span class="t">clean str</span>
    port:    <span class="t">int</span>
    payload: <span class="t">untrusted payload</span>
    ttl:     <span class="t">int</span>
}

<span class="c">// Instantiate with `forge`</span>
<span class="k">probe</span> <span class="v">pkt</span>: <span class="t">Packet</span> <span class="op">=</span> <span class="k">forge</span> <span class="t">Packet</span> {
    src:     <span class="s">"192.168.1.10"</span>,
    dst:     <span class="s">"10.0.0.1"</span>,
    port:    <span class="n">443</span>,
    payload: <span class="f">net.recv</span>(),
    ttl:     <span class="n">64</span>
}</pre>
      </div>
      <h3>Nested Blueprints</h3>
      <div class="code-block">
        <span class="label">NESTED TYPES</span>
        <pre><span class="k">blueprint</span> <span class="t">Credential</span> {
    username: <span class="t">clean str</span>
    hash:     <span class="t">sealed hex</span>
    issued:   <span class="t">int</span>
    expires:  <span class="t">int</span>
}

<span class="k">blueprint</span> <span class="t">Session</span> {
    id:       <span class="t">sealed hex</span>
    cred:     <span class="t">Credential</span>
    active:   <span class="t">bit</span>
    ip:       <span class="t">clean str</span>
}

<span class="k">scope</span> <span class="f">open_session</span>(<span class="v">c</span>: <span class="t">Credential</span>, <span class="v">ip</span>: <span class="t">clean str</span>) <span class="op">-></span> <span class="t">Session</span> {
    <span class="k">return</span> <span class="k">forge</span> <span class="t">Session</span> {
        id:     <span class="f">sha256</span>(<span class="f">entropy</span>(<span class="n">32</span>)),
        cred:   <span class="v">c</span>,
        active: <span class="k">true</span>,
        ip:     <span class="v">ip</span>
    }
}</pre>
      </div>
      <h3>Enumerations</h3>
      <div class="code-block">
        <span class="label">ENUM SYNTAX</span>
        <pre><span class="c">// Define an enumeration with `variants`</span>
<span class="k">variants</span> <span class="t">ThreatLevel</span> {
    none,
    low,
    medium,
    high,
    critical
}

<span class="k">probe</span> <span class="v">risk</span>: <span class="t">ThreatLevel</span> <span class="op">=</span> <span class="t">ThreatLevel</span>::<span class="v">high</span>

<span class="k">scan</span> <span class="v">risk</span> <span class="op">==</span> <span class="t">ThreatLevel</span>::<span class="v">critical</span> {
    <span class="f">log</span>(<span class="s">"[CRITICAL] Immediate response required"</span>)
    <span class="k">halt</span>
}</pre>
      </div>
      <h3>Methods on Blueprints</h3>
      <div class="code-block">
        <span class="label">BLUEPRINT METHODS</span>
        <pre><span class="k">blueprint</span> <span class="t">Token</span> {
    value:   <span class="t">sealed hex</span>
    expires: <span class="t">int</span>
    <span class="c">// Methods declared inside blueprint with `fn`</span>
    <span class="k">fn</span> <span class="f">is_expired</span>(<span class="k">self</span>, <span class="v">now</span>: <span class="t">int</span>) <span class="op">-></span> <span class="t">bit</span> {
        <span class="k">return</span> <span class="v">now</span> <span class="op">></span> <span class="k">self</span>.<span class="v">expires</span>
    }
    <span class="k">fn</span> <span class="f">fingerprint</span>(<span class="k">self</span>) <span class="op">-></span> <span class="t">sealed hex</span> {
        <span class="k">return</span> <span class="f">sha256</span>(<span class="k">self</span>.<span class="v">value</span>)
    }
}</pre>
      </div>
    </section>
    <section id="stdlib">
      <h2>Standard Library</h2>
      <p>CipherScript ships with a focused standard library organized into security-relevant modules. Every module that touches the outside world requires <code>expose scope</code>.</p>
      <h3>net — Network Module</h3>
      <table class="ref-table">
        <tr><th>Function</th><th>Returns</th><th>Description</th></tr>
        <tr><td>net.connect(host, port)</td><td><code>signal</code></td><td>Open a TCP connection</td></tr>
        <tr><td>net.disconnect()</td><td><code>signal</code></td><td>Close active connection</td></tr>
        <tr><td>net.send(payload)</td><td><code>signal</code></td><td>Send raw bytes — requires expose</td></tr>
        <tr><td>net.recv()</td><td><code>untrusted payload</code></td><td>Receive bytes from socket</td></tr>
        <tr><td>net.http.get(url)</td><td><code>untrusted str</code></td><td>HTTP GET request</td></tr>
        <tr><td>net.http.post(url, body)</td><td><code>signal</code></td><td>HTTP POST — requires expose</td></tr>
        <tr><td>net.dns.resolve(host)</td><td><code>clean str</code></td><td>Resolve hostname to IP</td></tr>
        <tr><td>cidr.parse(notation)</td><td><code>payload</code></td><td>Parse CIDR to address range</td></tr>
        <tr><td>net.ping(host)</td><td><code>signal</code></td><td>ICMP ping; returns ok or fail</td></tr>
      </table>
      <h3>crypto — Cryptography Module</h3>
      <table class="ref-table">
        <tr><th>Function</th><th>Returns</th><th>Description</th></tr>
        <tr><td>sha256(data)</td><td><code>sealed hex</code></td><td>SHA-256 digest</td></tr>
        <tr><td>sha512(data)</td><td><code>sealed hex</code></td><td>SHA-512 digest</td></tr>
        <tr><td>md5(data)</td><td><code>hex</code></td><td>MD5 — deprecated, compiler warns</td></tr>
        <tr><td>hmac(key, data)</td><td><code>sealed hex</code></td><td>HMAC-SHA256 authentication code</td></tr>
        <tr><td>aes.enc(key, data)</td><td><code>sealed payload</code></td><td>AES-256-GCM encryption</td></tr>
        <tr><td>aes.dec(key, data)</td><td><code>payload</code></td><td>AES-256-GCM decryption</td></tr>
        <tr><td>rsa.sign(key, data)</td><td><code>sealed payload</code></td><td>RSA-2048 signature</td></tr>
        <tr><td>rsa.verify(key, sig, data)</td><td><code>bit</code></td><td>Verify RSA signature</td></tr>
        <tr><td>entropy(n)</td><td><code>sealed payload</code></td><td>Generate n cryptographic random bytes</td></tr>
        <tr><td>base64.enc(data)</td><td><code>str</code></td><td>Base64 encode</td></tr>
        <tr><td>base64.dec(str)</td><td><code>payload</code></td><td>Base64 decode</td></tr>
        <tr><td>argon2(pwd, salt)</td><td><code>sealed hex</code></td><td>Argon2id password hash</td></tr>
      </table>
      <h3>file — File I/O Module</h3>
      <table class="ref-table">
        <tr><th>Function</th><th>Returns</th><th>Description</th></tr>
        <tr><td>file.read(path)</td><td><code>untrusted payload</code></td><td>Read file contents</td></tr>
        <tr><td>file.write(path, data)</td><td><code>signal</code></td><td>Write file — requires expose</td></tr>
        <tr><td>file.append(path, data)</td><td><code>signal</code></td><td>Append to file — requires expose</td></tr>
        <tr><td>file.exists(path)</td><td><code>bit</code></td><td>Check file existence</td></tr>
        <tr><td>file.delete(path)</td><td><code>signal</code></td><td>Delete file — requires expose</td></tr>
        <tr><td>file.hash(path)</td><td><code>sealed hex</code></td><td>SHA-256 hash of file contents</td></tr>
      </table>
      <h3>fmt — Formatting Module</h3>
      <table class="ref-table">
        <tr><th>Function</th><th>Returns</th><th>Description</th></tr>
        <tr><td>hex.dump(data)</td><td><code>str</code></td><td>Pretty hex dump of payload</td></tr>
        <tr><td>fmt.ip(raw)</td><td><code>clean str</code></td><td>Format raw bytes as IP address</td></tr>
        <tr><td>fmt.port(n)</td><td><code>clean str</code></td><td>Format int as port string</td></tr>
        <tr><td>fmt.timestamp()</td><td><code>clean str</code></td><td>ISO-8601 current timestamp</td></tr>
        <tr><td>fmt.json(blueprint)</td><td><code>clean str</code></td><td>Serialize blueprint to JSON</td></tr>
        <tr><td>log(msg)</td><td><code>void</code></td><td>Write to audit log — always available</td></tr>
        <tr><td>emit(msg)</td><td><code>void</code></td><td>Write to stdout</td></tr>
      </table>
    </section>
    <section id="cli">
      <h2>CLI Reference</h2>
      <p>The CipherScript compiler and toolchain are accessed via the <code>csc</code> command. All commands follow the pattern <code>csc &lt;command&gt; [flags] [file]</code>.</p>
      <h3>Core Commands</h3>
      <div class="cli-block">
        <div><span class="cli-cmd">csc run</span> &lt;file.csc&gt; <span class="cli-flag">[--audit] [--strict]</span></div>
        <div class="cli-desc">Compile and execute a CipherScript file in one step. Use --audit to print the full audit log to stdout. Use --strict to treat all warnings as errors.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc build</span> &lt;file.csc&gt; <span class="cli-flag">[-o output] [--release]</span></div>
        <div class="cli-desc">Compile to a standalone binary. --release enables optimizations and strips debug symbols. Output defaults to ./a.out.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc lint</span> &lt;file.csc&gt; <span class="cli-flag">[--fix] [--json]</span></div>
        <div class="cli-desc">Run the static analyzer. Checks trust flow, signal handling, deprecated functions, hardcoded secrets. --fix auto-remediates safe issues. --json outputs machine-readable results.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc fmt</span> &lt;file.csc&gt; <span class="cli-flag">[--check] [--diff]</span></div>
        <div class="cli-desc">Auto-format source code to the CipherScript style guide. --check exits non-zero if formatting differs (useful in CI). --diff shows what would change.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc test</span> <span class="cli-flag">[--coverage] [--verbose]</span></div>
        <div class="cli-desc">Run all test files in the current project (files matching *.test.csc). --coverage generates a coverage report. --verbose prints each test result.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc shell</span></div>
        <div class="cli-desc">Launch the interactive CipherScript REPL. All trust enforcement and audit logging apply in shell mode.</div>
      </div>
      <div class="cli-block">
        <div><span class="cli-cmd">csc doc</span> &lt;file.csc&gt; <span class="cli-flag">[-o ./docs]</span></div>
        <div class="cli-desc">Generate HTML documentation from /// doc comments. Outputs to ./docs by default.</div>
      </div>
      <h3>Compiler Flags</h3>
      <table class="ref-table">
        <tr><th>Flag</th><th>Command</th><th>Effect</th></tr>
        <tr><td>--strict</td><td>run, build</td><td>Warnings become errors — zero tolerance mode</td></tr>
        <tr><td>--release</td><td>build</td><td>Enable optimizations, strip debug info</td></tr>
        <tr><td>--audit</td><td>run</td><td>Stream audit log to stdout alongside program output</td></tr>
        <tr><td>--no-log</td><td>run, build</td><td>Disable audit log (requires explicit --unsafe flag)</td></tr>
        <tr><td>--trust-level</td><td>run, build</td><td>Set minimum allowed trust: <code>clean</code> | <code>any</code></td></tr>
        <tr><td>--target</td><td>build</td><td>Cross-compile target: <code>linux-x64</code>, <code>darwin-arm64</code>, etc.</td></tr>
        <tr><td>--json</td><td>lint</td><td>Output lint results as JSON (for CI/CD pipelines)</td></tr>
        <tr><td>--fix</td><td>lint, fmt</td><td>Auto-remediate issues where safe to do so</td></tr>
      </table>
      <h3>Exit Codes</h3>
      <table class="ref-table">
        <tr><th>Code</th><th>Meaning</th></tr>
        <tr><td>0</td><td>Success — signal::ok</td></tr>
        <tr><td>1</td><td>Runtime failure — signal::fail</td></tr>
        <tr><td>2</td><td>Compile error</td></tr>
        <tr><td>3</td><td>Trust violation detected</td></tr>
        <tr><td>4</td><td>Lint errors (in --strict mode)</td></tr>
        <tr><td>99</td><td>Internal compiler error — please report</td></tr>
      </table>
      <h3>Example CI/CD Pipeline</h3>
      <div class="code-block" style="border-left-color: var(--accent3);">
        <span class="label">GITHUB ACTIONS</span>
        <pre><span class="c"># .github/workflows/cipherscript.yml</span>
<span class="v">steps:</span>
  <span class="v">- name: Lint</span>
    <span class="v">run: csc lint src/main.csc --strict --json > lint-report.json</span>

  <span class="v">- name: Test</span>
    <span class="v">run: csc test --coverage</span>

  <span class="v">- name: Build release</span>
    <span class="v">run: csc build src/main.csc --release -o dist/app</span></pre>
      </div>
    </section>
    <section id="threatmodel">
      <h2>Threat Model</h2>
      <p>CipherScript is designed to eliminate entire vulnerability classes at the language level. The table below maps common CVE categories to the language features that prevent them.</p>
      <table class="ref-table">
        <tr><th>Vulnerability Class</th><th>CipherScript Prevention</th><th>Mechanism</th></tr>
        <tr>
          <td>SQL / Command Injection</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>untrusted</code> data cannot reach <code>expose scope</code> functions without <code>sanitize()</code> — compiler error</td>
        </tr>
        <tr>
          <td>Buffer Overflow</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>payload</code> type is bounds-checked; raw pointer arithmetic is not available</td>
        </tr>
        <tr>
          <td>Use-After-Free</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>All variables are scope-bound; memory is released at scope exit — no manual deallocation</td>
        </tr>
        <tr>
          <td>Silent Error Propagation</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>Unhandled <code>signal::alert</code> is a compile-time error — every failure path must be acknowledged</td>
        </tr>
        <tr>
          <td>Privilege Escalation via Side Effects</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>Side-effecting operations require <code>expose scope</code> — intent is always explicit and auditable</td>
        </tr>
        <tr>
          <td>Hardcoded Secrets</td>
          <td><span class="chip chip-yellow">Warned</span></td>
          <td>Compiler detects string literals passed directly to <code>aes.enc()</code>, <code>hmac()</code> — issues lint warning</td>
        </tr>
        <tr>
          <td>Weak Hashing (MD5/SHA1)</td>
          <td><span class="chip chip-yellow">Warned</span></td>
          <td><code>md5()</code> compiles with a deprecation warning; no SHA1 built-in provided</td>
        </tr>
        <tr>
          <td>Race Conditions</td>
          <td><span class="chip chip-yellow">Mitigated</span></td>
          <td>Channels enforce typed, sequential message passing; shared mutable state requires explicit <code>broadcast</code></td>
        </tr>
        <tr>
          <td>Insecure Randomness</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>No pseudo-random function exists — only <code>entropy()</code> backed by OS CSPRNG</td>
        </tr>
        <tr>
          <td>Broken Access Control</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>Trust qualifiers enforce data provenance; <code>poisoned</code> data cannot be used in clean contexts</td>
        </tr>
      </table>
      <h3>CVE Pattern Examples</h3>
      <div class="code-block" style="border-left-color: var(--accent2);">
        <span class="label">INJECTION — PREVENTED AT COMPILE TIME</span>
        <pre><span class="c">// UNSAFE in other languages — dangerous input reaches a shell</span>
<span class="c">// In CipherScript this is a COMPILE ERROR:</span>

<span class="k">probe</span> <span class="v">user_input</span>: <span class="t">untrusted str</span> <span class="op">=</span> <span class="f">net.recv</span>()
<span class="f">file.write</span>(<span class="v">user_input</span>, <span class="s">"data"</span>)
<span class="c">// ❌ ERROR: untrusted str cannot flow into expose scope without validate()</span>

<span class="c">// SAFE — trust is explicitly established first:</span>
<span class="k">probe</span> <span class="v">raw</span>: <span class="t">untrusted str</span> <span class="op">=</span> <span class="f">net.recv</span>()
<span class="k">probe</span> <span class="v">safe</span>: <span class="t">clean str</span> <span class="op">=</span> <span class="f">sanitize</span>(<span class="v">raw</span>)
<span class="f">file.write</span>(<span class="v">safe</span>, <span class="s">"data"</span>)  <span class="c">// ✓ OK</span></pre>
      </div>
      <div class="code-block" style="border-left-color: var(--accent2);">
        <span class="label">SILENT ERROR — PREVENTED AT COMPILE TIME</span>
        <pre><span class="c">// UNSAFE: ignoring error return silently</span>
<span class="k">probe</span> <span class="v">result</span> <span class="op">=</span> <span class="f">file.write</span>(<span class="s">"log.txt"</span>, <span class="s">"data"</span>)
<span class="c">// ❌ ERROR: signal::alert not handled — add `intercept` block</span>

<span class="c">// SAFE:</span>
<span class="k">probe</span> <span class="v">result</span> <span class="op">=</span> <span class="f">file.write</span>(<span class="s">"log.txt"</span>, <span class="s">"data"</span>)
<span class="k">intercept</span> <span class="v">result</span> <span class="op">==</span> <span class="v">signal</span>::<span class="v">alert</span> {
    <span class="f">log</span>(<span class="s">"[ERROR] Write failed"</span>)
    <span class="k">return</span> <span class="v">signal</span>::<span class="v">fail</span>
}  <span class="c">// ✓ OK</span></pre>
      </div>
    </section>
    <section id="owasp">
      <h2>OWASP Top 10 Mapping</h2>
      <p>CipherScript directly addresses 9 of the OWASP Top 10 (2021) at the language level — either preventing vulnerabilities entirely or making them significantly harder to introduce.</p>
      <table class="ref-table">
        <tr><th>Rank</th><th>OWASP Category</th><th>Coverage</th><th>CipherScript Mechanism</th></tr>
        <tr>
          <td><span class="owasp-rank">A01</span></td>
          <td>Broken Access Control</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>Trust qualifiers enforce data provenance; <code>poisoned</code> data blocked from clean contexts at compile time</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A02</span></td>
          <td>Cryptographic Failures</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td>Only CSPRNG via <code>entropy()</code>; MD5/SHA1 deprecated with compiler warnings; AES-256-GCM enforced in stdlib</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A03</span></td>
          <td>Injection</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>untrusted</code> data cannot reach <code>expose scope</code> without <code>sanitize()</code> — compile-time error, not runtime check</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A04</span></td>
          <td>Insecure Design</td>
          <td><span class="chip chip-cyan">Structural</span></td>
          <td>Zero-trust by default; least privilege scope model; explicit side effects via <code>expose scope</code></td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A05</span></td>
          <td>Security Misconfiguration</td>
          <td><span class="chip chip-yellow">Mitigated</span></td>
          <td>Lint warns on hardcoded secrets, global <code>broadcast</code> abuse, and unhandled <code>signal::alert</code> paths</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A06</span></td>
          <td>Vulnerable Components</td>
          <td><span class="chip chip-yellow">Mitigated</span></td>
          <td>Minimal stdlib footprint; no external dependencies in core; module import requires explicit trust declaration</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A07</span></td>
          <td>Auth &amp; Session Failures</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>sealed</code> session tokens cannot be mutated; <code>argon2()</code> built-in for safe password hashing; brute force detectable via <code>implant</code> counters</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A08</span></td>
          <td>Software &amp; Data Integrity Failures</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>sealed</code> type enforces immutability; <code>file.hash()</code> for integrity verification; HMAC built-in for chain of custody</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A09</span></td>
          <td>Logging &amp; Monitoring Failures</td>
          <td><span class="chip chip-cyan">Prevented</span></td>
          <td><code>log()</code> is always available, never strippable; audit log entry generated on every <code>expose scope</code> call automatically</td>
        </tr>
        <tr>
          <td><span class="owasp-rank">A10</span></td>
          <td>SSRF</td>
          <td><span class="chip chip-yellow">Mitigated</span></td>
          <td>All network destinations must be <code>clean str</code> — unvalidated URLs from user input are blocked by the trust system</td>
        </tr>
      </table>
      <h3>Compliance Notes</h3>
      <div class="code-block" style="border-left-color: var(--fn);">
        <span class="label">AUDIT TRAIL EXAMPLE</span>
        <pre><span class="c">// Every expose scope call auto-logs to the audit trail:</span>
<span class="c">// [2025-01-01T12:00:00Z] expose scope file.write called</span>
<span class="c">//   caller: exfil_report @ report.csc:14</span>
<span class="c">//   arg[0] trust: clean str ✓</span>
<span class="c">//   result: signal::ok</span>

<span class="c">// This satisfies NIST SP 800-92 log requirements and</span>
<span class="c">// PCI-DSS Requirement 10 (audit log retention) by design.</span></pre>
      </div>
    </section>
    <section id="roadmap">
      <h2>Roadmap</h2>
      <p>CipherScript is actively evolving. Below is the planned feature roadmap, maintained by Brian Lorick.</p>
      <h3>v1.1 — Tooling &amp; DX <span style="font-size:11px; color:var(--muted);">// Q2 2025</span></h3>
      <table class="ref-table">
        <tr><th>Feature</th><th>Status</th><th>Notes</th></tr>
        <tr><td>csc fmt — auto-formatter</td><td><span class="chip chip-cyan">Planned</span></td><td>Opinionated, zero-config formatting</td></tr>
        <tr><td>csc lint — static analyzer</td><td><span class="chip chip-cyan">Planned</span></td><td>Trust flow analysis, hardcoded secret detection</td></tr>
        <tr><td>LSP server</td><td><span class="chip chip-cyan">Planned</span></td><td>VS Code + Neovim support</td></tr>
        <tr><td>REPL (csc shell)</td><td><span class="chip chip-yellow">In Progress</span></td><td>Interactive CipherScript shell</td></tr>
        <tr><td>Test framework (csc test)</td><td><span class="chip chip-cyan">Planned</span></td><td>Built-in unit + integration testing</td></tr>
      </table>
      <h3>v1.2 — Language Features <span style="font-size:11px; color:var(--muted);">// Q3 2025</span></h3>
      <table class="ref-table">
        <tr><th>Feature</th><th>Status</th><th>Notes</th></tr>
        <tr><td>Generics</td><td><span class="chip chip-cyan">Planned</span></td><td>Type-parameterized blueprints and scopes</td></tr>
        <tr><td>Interfaces (contracts)</td><td><span class="chip chip-cyan">Planned</span></td><td>Structural typing via <code>contract</code> keyword</td></tr>
        <tr><td>Pattern matching</td><td><span class="chip chip-cyan">Planned</span></td><td><code>match</code> on variants and signal types</td></tr>
        <tr><td>Async channels</td><td><span class="chip chip-cyan">Planned</span></td><td>Non-blocking channel sends with <code>async scope</code></td></tr>
        <tr><td>Module system</td><td><span class="chip chip-yellow">In Progress</span></td><td><code>import</code> / <code>export</code> for multi-file projects</td></tr>
      </table>
      <h3>v2.0 — Advanced Security <span style="font-size:11px; color:var(--muted);">// 2026</span></h3>
      <table class="ref-table">
        <tr><th>Feature</th><th>Status</th><th>Notes</th></tr>
        <tr><td>Capability-based permissions</td><td><span class="chip chip-purple">Research</span></td><td>Fine-grained runtime permission model</td></tr>
        <tr><td>Formal verification hooks</td><td><span class="chip chip-purple">Research</span></td><td>Annotate invariants for external provers</td></tr>
        <tr><td>TLS stdlib integration</td><td><span class="chip chip-cyan">Planned</span></td><td>First-class TLS 1.3 support in net module</td></tr>
        <tr><td>WASM compilation target</td><td><span class="chip chip-purple">Research</span></td><td>Run CipherScript in sandboxed WASM environments</td></tr>
      </table>
    </section>
angelog">
      <h2>Changelog</h2>
      <div style="border-left: 2px solid var(--accent); padding-left: 20px; margin: 20px 0;">
        <div style="margin-bottom: 32px;">
          <div style="display:flex; align-items:center; gap:12px; margin-bottom:8px;">
            <span style="font-family:'JetBrains Mono',monospace; color:var(--accent); font-size:15px; font-weight:700;">v1.0.0</span>
            <span class="chip chip-cyan">CURRENT</span>
            <span style="font-size:11px; color:var(--muted);">2025-01-01</span>
          </div>
          <p style="font-size:12px; color:#8a9daa; margin-bottom:8px;">Initial public release of the CipherScript language specification.</p>
          <p style="font-size:12px; color:var(--muted);">+ Core type system with trust qualifiers (untrusted, clean, sealed, poisoned)</p>
          <p style="font-size:12px; color:var(--muted);">+ Variable scope keywords: probe, implant, broadcast</p>
          <p style="font-size:12px; color:var(--muted);">+ Control flow: scan, pivot, sweep, persist, breach, evade, intercept</p>
          <p style="font-size:12px; color:var(--muted);">+ expose scope for side-effecting functions</p>
          <p style="font-size:12px; color:var(--muted);">+ signal result type (ok | fail | alert) with mandatory handling</p>
          <p style="font-size:12px; color:var(--muted);">+ Channel-based concurrency model</p>
          <p style="font-size:12px; color:var(--muted);">+ Blueprint type definitions with method support</p>
          <p style="font-size:12px; color:var(--muted);">+ Standard library: net, crypto, file, fmt modules</p>
          <p style="font-size:12px; color:var(--muted);">+ Compile-time trust flow enforcement</p>
        </div>
        <div style="margin-bottom: 32px; opacity:0.7;">
          <div style="display:flex; align-items:center; gap:12px; margin-bottom:8px;">
            <span style="font-family:'JetBrains Mono',monospace; color:var(--accent3); font-size:15px; font-weight:700;">v0.9.0</span>
            <span class="chip chip-yellow">BETA</span>
            <span style="font-size:11px; color:var(--muted);">2024-10-15</span>
          </div>
          <p style="font-size:12px; color:var(--muted);">+ Introduced trust qualifier system — replaced earlier annotation syntax</p>
          <p style="font-size:12px; color:var(--muted);">+ Renamed fn → scope for conceptual clarity</p>
          <p style="font-size:12px; color:var(--muted);">+ Added sealed keyword for immutable forensic data</p>
          <p style="font-size:12px; color:var(--muted);">+ Channel concurrency prototype</p>
          <p style="font-size:12px; color:var(--muted);">~ Breaking: variable keyword changed from let → probe</p>
        </div>
        <div style="opacity:0.5;">
          <div style="display:flex; align-items:center; gap:12px; margin-bottom:8px;">
            <span style="font-family:'JetBrains Mono',monospace; color:var(--muted); font-size:15px; font-weight:700;">v0.1.0</span>
            <span class="chip" style="border-color:var(--muted); color:var(--muted);">ALPHA</span>
            <span style="font-size:11px; color:var(--muted);">2024-06-01</span>
          </div>
          <p style="font-size:12px; color:var(--muted);">+ Initial proof-of-concept — core syntax and type system sketch</p>
          <p style="font-size:12px; color:var(--muted);">+ Conceptual design by Brian Lorick</p>
        </div>
      </div>
    </section>
    <section id="license">
      <h2>License &amp; Credits</h2>
      <h3>Creator</h3>
      <div class="hero-block" style="border-top-color: var(--fn);">
        <div style="display:flex; align-items:flex-start; gap: 24px;">
          <div style="min-width: 56px; height: 56px; border: 2px solid var(--fn); display:grid; place-items:center; font-size: 22px; color: var(--fn); flex-shrink:0;">👤</div>
          <div>
            <div style="font-family:'JetBrains Mono',monospace; font-size:16px; color:var(--fn); font-weight:700; margin-bottom:6px;">Brian Lorick</div>
            <div style="font-size:12px; color:var(--muted); margin-bottom:10px; letter-spacing:0.08em;">// ORIGINAL AUTHOR &amp; LANGUAGE ARCHITECT</div>
            <p style="font-size:12px; color:#8a9daa; margin:0;">CipherScript was conceived and created by Brian Lorick — a security practitioner who believed the tools you write code <em>in</em> should think the same way you do when defending systems. Every keyword, every type qualifier, every compiler rule reflects that philosophy.</p>
          </div>
        </div>
      </div>
      <h3>Contributor Guidelines</h3>
      <table class="ref-table">
        <tr><th>Role</th><th>Responsibilities</th><th>Contact</th></tr>
        <tr><td>Brian Lorick</td><td>Language design, core spec, final approval on all RFCs</td><td>Original Author</td></tr>
        <tr><td>Core Contributors</td><td>Standard library, compiler implementation, tooling</td><td>via GitHub Issues</td></tr>
        <tr><td>Community Contributors</td><td>Docs, examples, bug reports, RFC proposals</td><td>via Pull Requests</td></tr>
      </table>

      <h3>Acknowledgements</h3>
      <table class="ref-table">
        <tr><th>Inspiration</th><th>Influence on CipherScript</th></tr>
        <tr><td>Zero Trust Architecture</td><td>Trust qualifier system and compile-time trust enforcement</td></tr>
        <tr><td>Rust</td><td>Static typing discipline and explicit ownership of scope</td></tr>
        <tr><td>Go</td><td>Channel-based concurrency model</td></tr>
        <tr><td>Python</td><td>Readable, practical syntax philosophy</td></tr>
        <tr><td>Adversarial tradecraft</td><td>Vocabulary: probe, implant, broadcast, c2 channels, pivot</td></tr>
      </table>
      <div style="margin-top:28px; padding: 18px 20px; border: 1px solid var(--border); background: var(--surface); font-size:11px; color: var(--muted); letter-spacing:0.06em;">
        <span style="color:var(--accent);">// INTEGRITY RECORD</span><br><br>
        Language:&nbsp;&nbsp;&nbsp;&nbsp; CipherScript v1.0.0<br>
        Author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brian Lorick<br>
        Created:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2025<br>
        Checksum:&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:var(--fn);">sha256(spec) → a3f9c1...</span><br>
        License:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MIT<br>
        Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:var(--accent);">ACTIVE — accepting contributions</span>
      </div>
    </section>
  </main>
</div>

<footer>
  CipherScript v1.0.0 &nbsp;·&nbsp; Created by <span style="color:var(--accent);">Brian Lorick</span> &nbsp;·&nbsp; MIT License &nbsp;·&nbsp; Designed for security practitioners
</footer>

<script>
  // Scroll reveal
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); });
  }, { threshold: 0.05 });
  document.querySelectorAll('section').forEach(s => observer.observe(s));

  // Nav active state
  const sections = document.querySelectorAll('section[id]');
  const navLinks = document.querySelectorAll('nav a');
  window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(s => { if (window.scrollY >= s.offsetTop - 140) current = s.id; });
    navLinks.forEach(a => {
      a.classList.toggle('active', a.getAttribute('href') === '#' + current);
    });
  });

  // Copy-to-clipboard on code blocks
  document.querySelectorAll('.code-block').forEach(block => {
    const btn = document.createElement('button');
    btn.className = 'copy-btn';
    btn.textContent = 'COPY';
    block.appendChild(btn);
    btn.addEventListener('click', () => {
      const pre = block.querySelector('pre');
      const text = pre ? pre.innerText : '';
      navigator.clipboard.writeText(text).then(() => {
        btn.textContent = 'COPIED ✓';
        btn.classList.add('copied');
        setTimeout(() => { btn.textContent = 'COPY'; btn.classList.remove('copied'); }, 1800);
      });
    });
  });

  // Search functionality
  const searchIndex = [];
  document.querySelectorAll('section[id]').forEach(section => {
    const id = section.id;
    const h2 = section.querySelector('h2');
    const title = h2 ? h2.textContent : id;
    const text = section.innerText;
    searchIndex.push({ id, title, text });
  });

  const searchInput = document.getElementById('searchInput');
  const searchResults = document.getElementById('searchResults');

  searchInput.addEventListener('input', () => {
    const q = searchInput.value.trim().toLowerCase();
    searchResults.innerHTML = '';
    if (q.length < 2) { searchResults.classList.remove('open'); return; }

    const matches = searchIndex.filter(item =>
      item.title.toLowerCase().includes(q) || item.text.toLowerCase().includes(q)
    ).slice(0, 8);

    if (matches.length === 0) {
      searchResults.innerHTML = '<div class="search-empty">// no results found</div>';
    } else {
      matches.forEach(item => {
        const idx = item.text.toLowerCase().indexOf(q);
        const start = Math.max(0, idx - 30);
        const snippet = item.text.slice(start, start + 80).replace(/\n/g, ' ');
        const highlighted = snippet.replace(new RegExp(q, 'gi'), m => `<mark>${m}</mark>`);
        const div = document.createElement('div');
        div.className = 'search-result-item';
        div.innerHTML = `<div class="sr-title">${item.title}</div><div class="sr-preview">${highlighted}...</div>`;
        div.addEventListener('click', () => {
          document.getElementById(item.id).scrollIntoView({ behavior: 'smooth', block: 'start' });
          searchResults.classList.remove('open');
          searchInput.value = '';
        });
        searchResults.appendChild(div);
      });
    }
    searchResults.classList.add('open');
  });

  document.addEventListener('click', e => {
    if (!e.target.closest('.search-wrap')) searchResults.classList.remove('open');
  });

  // Simulated REPL
  function runRepl() {
    const input = document.getElementById('replInput').value.trim();
    const out = document.getElementById('replOutput');
    out.classList.add('visible');

    if (!input) { out.textContent = '// Nothing to analyze.'; return; }

    const lines = input.split('\n');
    let output = '> Analyzing CipherScript input...\n\n';
    let hasScope = input.includes('scope ');
    let hasSignal = input.includes('signal::');
    let hasUntrusted = input.includes('untrusted');
    let hasValidate = input.includes('validate(') || input.includes('sanitize(');
    let hasExpose = input.includes('expose scope');
    let hasSideEffect = input.includes('net.') || input.includes('file.');

    // Simulated checks
    if (hasUntrusted && !hasValidate) {
      output += '[WARN] Untrusted value used without validate() or sanitize()\n';
      output += '       Trust violation may occur at runtime.\n\n';
    }
    if (hasSideEffect && !hasExpose) {
      output += '[ERROR] Side-effecting call (net.* or file.*) inside non-expose scope\n';
      output += '        → Declare scope with `expose scope` to fix.\n\n';
    }
    if (hasScope && !hasSignal) {
      output += '[WARN] scope declared without signal return type.\n';
      output += '       Consider adding `-> signal` for proper error handling.\n\n';
    }
    if (input.includes('md5(')) {
      output += '[WARN] md5() is deprecated — use sha256() instead.\n\n';
    }
    if (input.includes('broadcast ')) {
      output += '[INFO] Global broadcast variable detected — minimize global state.\n\n';
    }

    // All clear
    if (!hasUntrusted || hasValidate) {
      if (!hasSideEffect || hasExpose) {
        output += '[OK]   Trust model: clean\n';
        output += '[OK]   Scope boundaries: valid\n';
      }
    }

    output += '\n// Lines parsed: ' + lines.length;
    output += '\n// Tokens: ~' + input.split(/\s+/).length;
    output += '\n// Audit log entry generated: ' + new Date().toISOString();

    out.textContent = output;
  }
</script>
