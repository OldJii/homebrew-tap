# frozen_string_literal: true

# MCP Dock - 一站式 MCP Server 管理工具
# https://github.com/OldJii/mcp-dock
cask "mcp-dock" do
  arch arm: "arm64", intel: "x64"

  version "1.1.7"
  sha256 arm:   :no_check,
         intel: :no_check

  url "https://github.com/OldJii/mcp-dock/releases/download/v#{version}/MCP.Dock-#{version}-#{arch}.dmg",
      verified: "github.com/OldJii/mcp-dock/"
  name "MCP Dock"
  desc "一站式 MCP Server 管理工具，支持 Cursor、Claude Desktop、Windsurf、Zed、TRAE"
  homepage "https://github.com/OldJii/mcp-dock"

  # 自动检查最新版本
  livecheck do
    url :url
    strategy :github_latest
  end

  # 由于应用未签名，需要移除隔离属性以解决"文件已损坏"的问题
  app "MCP Dock.app"

  # 安装后移除隔离属性（解决 macOS Gatekeeper 阻止未签名应用的问题）
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MCP Dock.app"],
                   sudo: false
  end

  # 卸载时清理残留文件
  uninstall quit: "com.mcp-dock.app"

  zap trash: [
    "~/.mcp-dock",
    "~/Library/Application Support/mcp-dock",
    "~/Library/Caches/com.mcp-dock.app",
    "~/Library/Preferences/com.mcp-dock.app.plist",
    "~/Library/Saved Application State/com.mcp-dock.app.savedState",
    "~/Library/Logs/mcp-dock",
  ]

  caveats <<~EOS
    ⚠️  由于 MCP Dock 未经过 Apple 签名，首次运行时可能会被 macOS 阻止。

    如果遇到"文件已损坏"或"无法打开"的提示，请在终端执行：
      xattr -cr /Applications/MCP\\ Dock.app

    或者在系统偏好设置 > 安全性与隐私 中点击"仍要打开"。

    📁 MCP Dock 的配置数据存储在 ~/.mcp-dock/ 目录下。
  EOS
end
