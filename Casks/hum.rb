cask "hum" do
  version "2026.2.1.0"
  sha256 "6492e95ba3f4c56d521cce87bf5b3e656fc63f20023121c70976725c379f3cee"

  url "https://github.com/TylerCodesTech/Hum-releases/releases/download/hum-v2026.2.1.0/Hum_2026.2.1.0_darwin_universal.dmg"
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
