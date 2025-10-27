function connect2android --description "Scrcpy android using ADB Wireless"
    set DEVICE_IP "192.168.1.99"
    set PORT_RANGE 30000-50000

    echo "[*] Scanning $DEVICE_IP for ADB wireless port..."

    # Scan for open TCP ports in ADB range
    set OPEN_PORT (nmap -p $PORT_RANGE --open $DEVICE_IP -Pn | string match -r '^\d{5}(?=/tcp)' | head -n 1)

    if test -z "$OPEN_PORT"
        echo "[!] No open ADB port found. Is Wireless Debugging enabled?"
        notify-send --app-name "Connect to Android" --icon phone "No android device found"
        return 1
    end

    echo "[+] Found open port: $OPEN_PORT"
    set ADB_TARGET "$DEVICE_IP:$OPEN_PORT"

    set ADB_CONNECTED (adb devices | grep -F "$ADB_TARGET" | grep -w "device" | wc -l)
    set SCRCPY_INSTANCES (pgrep -x scrcpy | wc -l)

    if test $ADB_CONNECTED -gt 0 -a $SCRCPY_INSTANCES -gt 0
        echo "[!] Both adb and scrcpy already running"
        notify-send --app-name "Connect to Android" --icon phone "Already connected"
        exit 0
    else
        echo "[*] Connecting to $ADB_TARGET..."
        adb connect "$ADB_TARGET"

        switch $argv[1]
            case screen
                echo "[*] Connecting android phone screen"
                notify-send --app-name "Connect to Android" --icon phone "Connected to android screen"
                scrcpy --video-encoder=OMX.google.h264.encoder --max-size=1280 --audio-encoder=c2.android.opus.encoder --stay-awake --turn-screen-off
            case audio
                echo "[*] Connecting android phone audio"
                notify-send --app-name "Connect to Android" --icon phone "Connected to android audio"
                scrcpy --no-video --audio-codec=opus --audio-encoder=c2.android.opus.encoder --stay-awake --no-window
            case '*'
                echo "[!] ADB connected, but it doesn't do anything. Try passing 'screen' or 'audio' as parameter"
        end
    end
end
