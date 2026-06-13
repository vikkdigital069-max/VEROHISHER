# 🔐 VEROHISHER v3.0 PRO

<div align="center">
  <img src="https://img.shields.io/badge/Version-3.0-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Platform-Termux-brightgreen?style=for-the-badge">
  <img src="https://img.shields.io/badge/Templates-40-red?style=for-the-badge">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge">
</div>

<p align="center">
  <b>VEROHISHER – Ultimate Phishing Framework with 40+ Templates, Auto Tunnel, URL Masking, and Professional UI.</b>
</p>

<p align="center">
  <img src="https://i.imgur.com/your-banner.png" alt="VEROHISHER Banner" width="800">
</p>

---

## 📌 **Features**

- ✅ **40 Ready-to-Use Templates** (Facebook, Instagram, Google, Twitter, Netflix, PayPal, Steam, Discord, WhatsApp, TikTok, LinkedIn, GitHub, Reddit, Twitch, Spotify, Amazon, Apple, Telegram, Yahoo, eBay, Dropbox, Adobe, WordPress, Tumblr, Pinterest, Flickr, Myspace, VK, Line, WeChat, Signal, IMDb, Hulu, Disney+, Epic Games, Origin, Uplay, and Custom URL).
- ✅ **Two Tunneling Options** – Ngrok & Cloudflared (automatic fallback).
- ✅ **URL Masking** – Convert long phishing links into short, clean URLs via TinyURL.
- ✅ **Auto Copy to Clipboard** – For Termux, the phishing link is automatically copied.
- ✅ **Real-time Victim Logs** – Captured credentials, IP addresses, and User-Agents are displayed in a neat table.
- ✅ **Professional UI** – ASCII art banner, colored borders, loading animations, and status indicators.
- ✅ **Lightweight & Fast** – Uses PHP built-in server, minimal dependencies.

---

## 📱 **Requirements**

- Android device with **Termux** installed.
- Internet connection.
- **Ngrok** or **Cloudflared** account (free tier works).
- No root required (but injection needs root for some features – for phishing only, root is NOT needed).

---

## 🔧 **Installation**

Open Termux and run the following commands:

```bash
# Update packages
pkg update && pkg upgrade -y

# Install required dependencies
pkg install git php curl wget unzip -y

# Clone repository (or create script manually)
git clone https://github.com/vikkdigital069-max/VEROHISHER.git
cd VEROHISHER

# Make script executable
chmod +x Verohisher.sh

# Run VEROHISHER
bash Verohisher.sh
