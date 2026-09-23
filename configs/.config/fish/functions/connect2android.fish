function connect2android --description "Scrcpy android using ADB Wireless"
    for cmd in nmap adb scrcpy noctalia
        if not command -q $cmd
            echo "[!] $cmd is not installed"
            return 1
        end
    end

    noctalia msg notification-show "Connect2Android" "Connecting Android Phone"
    if set -q connect2android_ip
        set DEVICE_IP $connect2android_ip
    else
        set DEVICE_IP "192.168.1.29"
    end
    set PORT_RANGE 33000-48000

    echo "[*] Scanning $DEVICE_IP for ADB wireless port..."

    # Scan for open TCP ports in ADB range
    set OPEN_PORT (nmap -p $PORT_RANGE --min-rate 5000 --open $DEVICE_IP -Pn | string match -m 1 -r '^\d{5}(?=/tcp)')

    if test -z "$OPEN_PORT"
        echo "[!] No open ADB port found. Is Wireless Debugging enabled?"
        noctalia msg notification-show "Connect2Android" "No android device found"
        return 1
    end

    echo "[+] Found open port: $OPEN_PORT"
    set ADB_TARGET "$DEVICE_IP:$OPEN_PORT"

    set ADB_CONNECTED (adb devices | string match -r "$ADB_TARGET.*device" | count)
    set SCRCPY_INSTANCES (pgrep -x scrcpy | count)

    if test $ADB_CONNECTED -gt 0 -a $SCRCPY_INSTANCES -gt 0
        echo "[!] Both adb and scrcpy already running"
        noctalia msg notification-show "Connect2Android" "Already connected"
        return 0
    end

    echo "[*] Connecting to $ADB_TARGET..."
    set CONNECT_OUTPUT (adb connect "$ADB_TARGET")

    if not string match -q '*connected*' "$CONNECT_OUTPUT"
        echo "[!] adb connect failed: $CONNECT_OUTPUT"
        noctalia msg notification-show "Connect2Android" "adb connect failed"
        return 1
    end

    if set -q argv[1]
        switch $argv[1]
            case screen
                echo "[*] Connecting android phone screen"
                noctalia msg notification-show "Connect2Android" "Android Screen Connected"
                scrcpy --stay-awake --turn-screen-off
            case audio
                echo "[*] Connecting android phone audio"
                noctalia msg notification-show "Connect2Android" "Android Audio Connected"
                scrcpy --no-video --stay-awake --no-window
            case '*'
                echo "[!] ADB connected, but it doesn't do anything. Try passing 'screen' or 'audio' as parameter"
                noctalia msg notification-show "Connect2Android" "Android Connected"
        end
    else
        echo "[!] ADB connected, but it doesn't do anything. Try passing 'screen' or 'audio' as parameter"
        noctalia msg notification-show "Connect2Android" "Android Connected"
    end
end
