function ytda --description 'Run mpv audio only'
  yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 "$argv"
end
