#!/usr/bin/env bash
# Author: t.mccall
# Created Date: 2026-11-14
# Last Revision: 2026-11-14 by t.mccall
# Called by: cask.yml

set -euo pipefail

version="$1"
sha="$2"

mkdir -p Casks
cat > Casks/hum.rb <<CASK
cask "hum" do
  version "${version}"
  sha256 "${sha}"

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
CASK
