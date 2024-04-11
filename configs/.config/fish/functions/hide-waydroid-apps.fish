function hide-waydroid-apps --description "Hide waydroid apps from menu"
    cd ~/.local/share/applications
    echo "[*] Hiding your waydroid apps from menu/runner"
    fd waydroid -E waydroid.desktop | xargs rg --files-without-match NoDisplay | xargs sed -i '/Desktop Action app_settings/iNoDisplay=true'
    echo "[*] Waydroid apps now no longer appear in menu/runner"
end
