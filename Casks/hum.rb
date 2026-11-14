cask "hum" do
  version "2026.2.0.1"
  sha256 "4d698a547bc448672e5e75d38c4d34c5411e3d6ebf9842b5c2fdfc7d41615f84"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v2026.2.0.1/Hum_2026.2.0.1_darwin_universal.dmg"
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
