# WAF Project — Nginx + ModSecurity (WSL) + Apache (XAMPP)

This repository contains configuration and helper files for a local Web Application Firewall (WAF) setup:
- Nginx (reverse proxy) running in **WSL/Ubuntu**
- ModSecurity v3 (ModSecurity-nginx connector) as WAF
- OWASP Core Rule Set (CRS) for detection and blocking
- Apache (XAMPP) backend on Windows (example port: 8081)

## Files included
- `nginx.conf` — global Nginx configuration (ModSecurity enabled)
- `default` — site config (reverse proxy to Apache)
- `modsec/main.conf` — ModSecurity main configuration
- `modsecurity-crs/` — (optional) OWASP CRS files (large; consider submodule or system install)
- `tests/test.php` — sanitized test page for XSS/SQLi testing
- `.gitignore` — recommended ignores

## Quick Start (high level)
1. Ensure XAMPP/Apache is installed on Windows and listening on a chosen port (e.g., 8081).
2. In Windows, copy `tests/test.php` to `C:\xampp\htdocs\test.php`.
3. In WSL (Ubuntu):
   - Install Nginx and ModSecurity (engine + nginx connector) and OWASP CRS.
   - Copy `nginx.conf` to `/etc/nginx/nginx.conf`.
   - Copy `default` to `/etc/nginx/sites-available/default` and `ln -s` to `sites-enabled`.
   - Copy `modsec/main.conf` to `/etc/nginx/modsec/main.conf`.
   - Ensure CRS is installed at `/usr/share/modsecurity-crs/` or update includes.
   - Test & restart Nginx:
     ```bash
     sudo nginx -t
     sudo systemctl restart nginx
     ```
4. Test via browser:
   - WAF route (goes through Nginx + ModSecurity): `http://localhost/test.php?id=<script>alert(1)</script>`
   - Direct Apache bypass: `http://localhost:8081/test.php?id=<script>alert(1)</script>`

## Notes & best practices
- Keep CRS files out of the main repo if they are large: reference them in README and instruct users to install CRS system-wide.
- Never commit private keys or binary modules (`*.so`/`*.dll`). Use download instructions or scripts.
- Start ModSecurity in `DetectionOnly` mode when tuning, then set `SecRuleEngine On` to block.

## Author
Chetan Nagulakonda — Cybersecurity / Blue Team
