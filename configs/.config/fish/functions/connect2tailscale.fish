function connect2tailscale --description "Connect to tailscale network"
    switch $argv[1]
        case off
            echo "[*] Turning off tailscale..."
            sudo tailscale down
            sudo systemctl stop tailscaled
            echo "[*] You're now disconnected from tailscale network"
        case '*'
            echo "[*] Turning on tailscale..."
            sudo systemctl start tailscaled
            sudo tailscale up
            echo "[*] You're now connected to tailscale network"
    end
end
