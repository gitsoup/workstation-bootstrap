---
hide:
  - toc
---

<div class="hero">
  <div class="eyebrow">OPEN-SOURCE SETUP GUIDE <span class="eyebrow-dot"></span> APPLE SILICON + macOS</div>
  <h1>A better starting point<br><span>for every new Mac.</span></h1>
  <p class="hero-lede">Build a clean development workstation with separate GitHub identities, predictable runtimes, and AI coding tools — without carrying over yesterday’s configuration.</p>
  <div class="hero-actions">
    <a class="hero-button primary" href="01-prerequisites/">Start the setup <span aria-hidden="true">→</span></a>
    <a class="hero-button secondary" href="https://github.com/gitsoup/workstation-bootstrap">View on GitHub <span aria-hidden="true">↗</span></a>
  </div>
  <div class="hero-meta"><span>Step-by-step instructions</span><span>Read-only verification scripts</span><span>No secrets in Git</span></div>
</div>

<div class="section-intro">
  <div class="kicker">THE WORKFLOW</div>
  <h2>From a fresh Mac to a reliable workstation.</h2>
  <p>Follow the guides in order, or jump to the part you need. Every stage is designed to be understandable and repeatable.</p>
</div>

<div class="guide-grid" markdown>
  <a class="guide-card" href="01-prerequisites/">
    <span class="guide-number">01 / FOUNDATION</span>
    <strong>Prepare the machine</strong>
    <span>macOS, Command Line Tools, Homebrew, and a stable workspace layout.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
  <a class="guide-card" href="02-git-and-ssh/">
    <span class="guide-number">02 / IDENTITIES</span>
    <strong>Separate Git and SSH</strong>
    <span>Independent personal and work identities, with explicit SSH routing.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
  <a class="guide-card" href="03-github-cli/">
    <span class="guide-number">03 / AUTHENTICATION</span>
    <strong>Route GitHub CLI</strong>
    <span>Use directory-aware authentication while keeping credentials separate.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
  <a class="guide-card" href="04-tooling/">
    <span class="guide-number">04 / TOOLCHAIN</span>
    <strong>Install development tools</strong>
    <span>mise, Node.js, uv, Python, and essential terminal utilities.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
  <a class="guide-card" href="05-ai-agents/">
    <span class="guide-number">05 / AGENTS</span>
    <strong>Set up coding assistants</strong>
    <span>Claude Code and Codex, with project-level instructions when needed.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
  <a class="guide-card" href="06-verification/">
    <span class="guide-number">06 / VALIDATION</span>
    <strong>Verify and maintain</strong>
    <span>Check identities, review security boundaries, and plan for recovery.</span>
    <span class="guide-arrow">Explore →</span>
  </a>
</div>

<div class="principle" markdown>
  <div>
    <span class="kicker">DESIGN PRINCIPLE</span>
    <h2>Configuration should be explicit. Security should not be assumed.</h2>
    <p>Directory-based Git and GitHub routing reduces mistakes, but is not a security sandbox. Always verify the account and remote before publishing code.</p>
  </div>
  <a href="07-security-and-recovery/">Read security guidance →</a>
</div>

<div class="footer-note">Built for developers who want a workstation they can understand, reproduce, and maintain.</div>
