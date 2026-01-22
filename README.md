# Homebrew Tap

这是 OldJii 的 Homebrew Tap 仓库，包含以下软件：

## 安装方式

```bash
# 安装软件（会自动添加 tap）
brew install --cask OldJii/tap/<cask-name>
```

## 可用软件

### MCP Dock

一站式 MCP Server 管理工具，支持 Cursor、Claude Desktop、Windsurf、Zed、TRAE。

```bash
# 安装
brew install --cask OldJii/tap/mcp-dock

# 更新
brew upgrade --cask mcp-dock
```

## 卸载软件

```bash
# 卸载应用
brew uninstall --cask mcp-dock

# 完全清理（包括配置文件）
brew uninstall --cask --zap mcp-dock
```
