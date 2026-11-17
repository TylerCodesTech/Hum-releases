cask "hum" do
  version "2026.2.4.0"
  sha256 "47c8810c01c9e741055e6d72902c891c2d2bf54729e0e733f9c4e0425e8c814c"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v2026.2.4.0/Hum_2026.2.4.0_darwin_universal.dmg"
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
