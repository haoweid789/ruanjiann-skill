#!/usr/bin/env bash
# ruanjiann-skill v3.0 安装脚本（Git Bash / Linux）
# 作用：将 ruanjiann-skill.md 注册到 ZCode 记忆目录，并更新 MEMORY.md 索引

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/ruanjiann-skill.md"
MEMORY_DIR="C:/Users/qw123/.zcode/cli/memories/projects/1111-ee346761cdb384c0/memory"
MEMORY_MD="$MEMORY_DIR/MEMORY.md"
SKILL_DST="$MEMORY_DIR/ruanjiann-skill.md"

echo "[ruanjiann-skill v3.0] 开始安装..."

# 1. 检查核心文件
if [[ ! -f "$SKILL_SRC" ]]; then
  echo "[ERROR] 未找到 $SKILL_SRC" >&2
  exit 1
fi

# 2. 确保记忆目录存在
mkdir -p "$MEMORY_DIR"

# 3. 复制技能文件
cp "$SKILL_SRC" "$SKILL_DST"
echo "[OK] 技能文件已复制到 $SKILL_DST"

# 4. 更新 MEMORY.md 索引（避免重复）
if grep -q 'ruanjiann-skill.md' "$MEMORY_MD" 2>/dev/null; then
  echo "[INFO] MEMORY.md 已包含 ruanjiann-skill 索引，跳过追加"
else
  echo "" >> "$MEMORY_MD"
  echo "- [软件工程专项技能 (ruanjiann-skill v3.0)](ruanjiann-skill.md) — 整合 13 个领域 + GitHub/Gitee cline/agent-md/snodo/ai-sdlc/loopra/agent-skills 等 SDLC 实践，端到端交付可运行、可测试、可维护、可审计的软件" >> "$MEMORY_MD"
  echo "[OK] MEMORY.md 索引已追加"
fi

# 5. 提示用户复制项目骨架模板（可选）
echo ""
echo "[提示] 若要在新项目中使用，请将 template/ 下的内容复制到项目根目录："
echo "  cp -r $SCRIPT_DIR/template/* /path/to/your-project/"
echo ""

echo "[ruanjiann-skill v3.0] 安装完成。下次 ZCode 会话将自动加载该技能。"
