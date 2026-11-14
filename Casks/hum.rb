cask "hum" do
  version "2026.1.2"
  sha256 "837f637c6359c2a9dbfc42c96f93f052b2879ac726d82cc76ced8c8c4e505f93"

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
