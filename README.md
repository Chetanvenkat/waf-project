# waf-project

# WAF Project: Nginx + ModSecurity (on Ubuntu via WSL)

## 🔰 Overview
This project sets up a Web Application Firewall (WAF) using **Nginx** and **ModSecurity** to protect a backend Apache (XAMPP) server on Windows.

## 🧩 Features
- Nginx Reverse Proxy with ModSecurity
- OWASP CRS for XSS, SQLi, and RCE protection
- Tested using simulated attack payloads
- Integrates with Apache (XAMPP) backend on port 8081

## 🧠 Tech Stack
- Nginx 1.24
- ModSecurity v3
- OWASP Core Rule Set (CRS)
- XAMPP (Apache/PHP backend)

## 🧪 Test Examples
- `http://localhost/test.php?id=<script>alert(1)</script>` → Blocked (XSS)
- `http://localhost/test.php?id=' OR '1'='1` → Blocked (SQLi)

## 📦 Folder Structure

## 🚀 Setup Summary
1. Installed Nginx & ModSecurity on Ubuntu (WSL)
2. Linked WAF to XAMPP backend (port 8081)
3. Applied OWASP CRS and verified protection
4. Tested XSS & SQL Injection successfully blocked

## 👤 Author
**(Chetan Nagulakonda)**
