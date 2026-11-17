cask "hum" do
  version "2026.2.2.0"
  sha256 "a71b197ce12959f107663a1ea51b41fafeee191b8e463d0d034a492541c4a60d"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v2026.2.2.0/Hum_2026.2.2.0_darwin_universal.dmg"
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
