cask "hum" do
  version "2026.2.0"
  sha256 "21013da53bea0aeef1019bb9a61013cb8c1299d1e53f72de05b6cc1c4e9d3189"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v#{version}/Hum_#{version}_universal.dmg"
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
