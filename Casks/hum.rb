cask "hum" do
  version "2026.2.5.1"
  sha256 "9e5d2dbd35518d60ee6fdd54353311824fdf7511c6c592b399eeba90acf74fb8"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v2026.2.5.1/Hum_2026.2.5.1_darwin_universal.dmg"
  name "Hum"
  desc "Editor for Symitar PowerOn with AI chat and spec task lists"
  homepage "https://github.com/TylerCodesTech/Hum-releases"

  auto_updates true

  app "Hum.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Hum.app"]
  end

  zap trash: [
    "~/Library/Application Support/tech.tylercodes.hum",
    "~/Library/Caches/tech.tylercodes.hum",
    "~/Library/WebKit/tech.tylercodes.hum",
  ]
end
