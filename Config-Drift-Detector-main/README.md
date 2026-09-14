# 🛡️ CCNA Network & Cloud Config Drift Detector

[![Python](https://img.shields.io/badge/Python-3.14-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-009688?style=for-the-badge&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![Netmiko](https://img.shields.io/badge/Netmiko-4.7.0-00599C?style=for-the-badge&logo=cisco&logoColor=white)](https://github.com/ktbyers/netmiko)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

An AI-powered DevSecOps & CCNA Computer Networking platform that detects configuration drifts across Cisco IOS routers, Switches, NGINX servers, JSON, and YAML files. Features automated 0–100 risk scoring, Wireshark packet capture filter generation, multi-stage attack pattern prediction, Netmiko SSH router self-healing, GitOps CI/CD deployment gates, and 1-click downloadable CISO audit PDF reports.

---

## 📌 Table of Contents
- [What is Configuration Drift?](#-what-is-configuration-drift)
- [3-Layer Defense Architecture](#-3-layer-defense-architecture)
- [Key Features](#-key-features)
- [Tech Stack](#-tech-stack)
- [System Workflow](#-system-workflow)
- [Installation & Quick Start](#-installation--quick-start)
- [Usage Instructions](#-usage-instructions)
- [Differentiators Matrix](#-differentiators-matrix)
- [Author & License](#-author--license)

---

## 💡 What is Configuration Drift?

In enterprise networks and cloud environments (Cisco Routers, Core Switches, Firewalls, Kubernetes, NGINX Web Servers), operations depend on **Configuration Files** (`running-config`, JSON, YAML).

When engineers make manual, un-tracked edits to these settings, it causes **Configuration Drift**.
* **The Problem**: A single unintended modification (e.g., changing `deny ip any any` to `permit ip any any` in a Cisco ACL or disabling SSL/TLS encryption) introduces critical security backdoors and unexpected outages.
* **Our Solution**: **Network Drift Detector** acts as a 24/7 AI-powered DevSecOps & Networking Guard that continuously compares live server configs against active baselines, audits network security rules, predicts cyber attack sequences, and executes 1-click self-healing fixes.

---

## 🛡️ 3-Layer Defense Architecture

```text
 🛡️ 3-LAYER DEFENSE ARCHITECTURE
 ├── 1. NETWORK SECURITY LAYER (CCNA Protocol Audit & Wireshark Packet Filters)
 ├── 2. CYBER THREAT INTELLIGENCE LAYER (Predictive Multi-Stage Attack Vision)
 └── 3. GITOPS AUTOMATION LAYER (Live File Collector & Netmiko SSH Self-Healing)
```

1. **Layer 1: Network Security Layer (CCNA Protocol Audit)**:
   * **Cisco IOS Config Parser**: Parses Cisco Router/Switch CLI syntax (`interface GigabitEthernet0/1`, `access-list extended`, `router ospf`).
   * **Network Topology & Blast Radius Heatmap**: Visualizes reachability across subnet nodes (`Router` ➔ `Switch` ➔ `Exposed Node` ➔ `Subnet DB`).
   * **🦈 Wireshark Packet Capture Filter**: Generates exact Wireshark packet capture commands (`tcp.port == 9090 || ip.addr == 192.168.1.1`) for live network packet sniffing.

2. **Layer 2: Cyber Threat Intelligence Layer (Predictive Attack Vision)**:
   * **Compliance Audit**: Maps configuration drifts to **OWASP Top 10 A05 (Misconfiguration)**, **PCI-DSS 4.1 Encryption**, and **CIS Benchmarks**.
   * **Predictive Attack Pattern Vision**: Analyzes drift trends to project multi-stage attack vectors (*Day 1 Port Edit ➔ Day 2 Firewall Bypass ➔ Day 3 Backdoor Account Creation*).
   * **🤖 'Ask Drift AI' Assistant**: Interactive chatbot with typo-tolerant fuzzy matching for instant SRE & firewall guidance.

3. **Layer 3: DevSecOps & Netmiko Automation Layer**:
   * **📌 Active Baseline Database Storage**: 1-click baseline storage (`backend/baseline.json`).
   * **🤖 Live System File Collector**: Automatically reads live server files on disk (`backend/data/live_server_config.txt`).
   * **🐍 Netmiko SSH Router Fetch & Auto-Heal**: Connects directly via Netmiko SSH to Cisco routers (`192.168.1.1`) to pull live configs or apply `send_config_set()` commands to update NVRAM memory (`write memory`).
   * **🐙 GitOps CI/CD Quality Gate Shield**: Blocks deployment pipelines if `Risk Score >= 50` and submits an **Auto-Healing Pull Request (`#143`)**.
   * **👀 Executive Before vs. After View**: Renders non-technical visual badges (`SSL = ON 🔒 ➔ SSL = OFF ❌`).

---

## 💻 Tech Stack

* **Language**: Python 3.14
* **Backend Framework**: FastAPI (Async REST APIs) & Uvicorn (ASGI Server on Port 8001)
* **Diff Comparison Engine**: `DeepDiff` (Recursive dictionary/list comparison engine)
* **Network Automation Engine**: `Netmiko` 4.7.0 / `Paramiko` 4.0.0 (SSH connection handler for `cisco_ios`)
* **File Parsers**: Custom Cisco IOS CLI Parser (`parse_cisco_ios`), PyYAML, JSON parser
* **AI Security Analyst**: Google Gemini API (`google-genai` / `google.generativeai`) with offline SRE fallback
* **PDF Engine**: Python `ReportLab` (Generates audit-ready PDF reports)
* **Frontend**: HTML5, Modern Dark CSS3 Glassmorphism UI, Vanilla JavaScript ES6+, Lucide Icons

---

## 🚀 Installation & Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/Kavishreesiva/network-drift-detection.git
cd network-drift-detection
```

### 2. Set Up Virtual Environment & Install Dependencies
```bash
# Create Python virtual environment
python -m venv backend/venv

# Activate virtual environment (Windows Command Prompt)
backend\venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### 3. Run the Application

#### Option A: 1-Click Batch Script (Windows)
Double-click **`run_server.bat`** in the project root directory.

#### Option B: Terminal Command
```bash
backend\venv\Scripts\python.exe -m uvicorn backend.app:app --host 127.0.0.1 --port 8001 --reload
```

### 4. Open in Web Browser
Open your browser and navigate to:
👉 **[http://127.0.0.1:8001](http://127.0.0.1:8001)**

---

## 🔄 Usage Instructions

1. **Analyze Drifts**: Select format parser (`Auto Detect`, `Cisco IOS`, `JSON`, `YAML`), paste baseline and live configs, and click **Analyze Drift**.
2. **Save Active Baseline**: Click **`📌 Save Active Baseline`** to store the baseline in the database.
3. **Live File Collector**: Edit `backend/data/live_server_config.txt` on disk and click **`🤖 Live Collector Scan`**.
4. **Netmiko SSH Router Fetch**: Click **`🐍 Netmiko SSH Fetch`**, enter router IP (`192.168.1.1`), and fetch live `show running-config` directly from Cisco hardware over SSH.
5. **Auto-Remediation & Netmiko Self-Healing**: Click **`Auto-Remediate (AI Fix)`** to view Bash, Ansible, and Cisco CLI scripts. Click **`⚡ SSH Auto-Heal (Netmiko)`** to apply configuration changes live on the router.
6. **Export PDF Reports**: Click **`Export PDF`** to generate and download a CISO audit report.

---

## 📊 Differentiators Matrix

| Feature Dimension | Standard Tools (*Git Diff, Meld*) | **Network Drift Detector** |
| :--- | :--- | :--- |
| **Cisco IOS Syntax Parsing** | ❌ No (Raw line compare only) | **✅ Cisco IOS (`running-config`), ACLs, VLANs, OSPF** |
| **Netmiko SSH Automation** | ❌ No | **✅ Netmiko SSH Live Router Fetching & Self-Healing** |
| **Wireshark Packet Forensics** | ❌ No | **✅ Dynamic Wireshark Packet Capture Filters** |
| **Executive Visual State View** | ❌ No (Raw code lines) | **✅ Before vs. After Visual Badges (`SSL = ON ➔ OFF ❌`)** |
| **Predictive Threat Analytics** | ❌ No (Current state only) | **✅ Multi-Stage Attack Sequence Prediction** |
| **GitOps CI/CD Integration** | ❌ No | **✅ Pipeline Quality Gate & Auto-PR Bot (`#143`)** |
| **Auto-Remediation Scripts** | ❌ No | **✅ Netmiko SSH, Cisco IOS CLI, Bash & Ansible** |
| **Risk Score Assessment** | ❌ No | **✅ Automated 0 – 100 Weighted Risk Score Gauge** |
| **CISO Audit PDF Reports** | ❌ No | **✅ 1-Click Downloadable CISO Audit PDF Reports** |

---

## 📄 License & Author

Developed by **[Kavishreesiva](https://github.com/Kavishreesiva)**  
Repository: [network-drift-detection](https://github.com/Kavishreesiva/network-drift-detection)  
License: [MIT License](LICENSE)
