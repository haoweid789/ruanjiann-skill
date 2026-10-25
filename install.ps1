# ruanjiann-skill v4.0 安装脚本（PowerShell / Windows）
# 作用：将 ruanjiann-skill.md 注册到 ZCode 记忆目录，并更新 MEMORY.md 索引

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$SkillSrc = Join-Path $ScriptDir "ruanjiann-skill.md"
$MemoryDir = "C:\Users\qw123\.zcode\cli\memories\projects\1111-ee346761cdb384c0\memory"
$MemoryMd = Join-Path $MemoryDir "MEMORY.md"
$SkillDst = Join-Path $MemoryDir "ruanjiann-skill.md"

Write-Host "[ruanjiann-skill v4.0] 开始安装..." -ForegroundColor Cyan

# 1. 检查核心文件
if (-not (Test-Path $SkillSrc)) {
  Write-Host "[ERROR] 未找到 $SkillSrc" -ForegroundColor Red
  exit 1
}

# 2. 确保记忆目录存在
if (-not (Test-Path $MemoryDir)) {
  New-Item -ItemType Directory -Path $MemoryDir -Force | Out-Null
}

# 3. 复制技能文件
Copy-Item $SkillSrc $SkillDst -Force
Write-Host "[OK] 技能文件已复制到 $SkillDst" -ForegroundColor Green

# 4. 更新 MEMORY.md 索引（避免重复）
if ((Get-Content $MemoryMd -Raw) -match 'ruanjiann-skill\.md') {
  Write-Host "[INFO] MEMORY.md 已包含 ruanjiann-skill 索引，跳过追加" -ForegroundColor Yellow
} else {
  Add-Content $MemoryMd ""
  Add-Content $MemoryMd "- [软件工程专项技能 (ruanjiann-skill v4.0)](ruanjiann-skill.md) — 整合 13 个领域 + GitHub/Gitee cline/agent-md/snodo/ai-sdlc/loopra/agent-skills/spec-kit 等 SDLC 实践，端到端交付可运行、可测试、可维护、可审计的软件"
  Write-Host "[OK] MEMORY.md 索引已追加" -ForegroundColor Green
}

# 5. 提示用户复制项目骨架模板（可选）
Write-Host ""
Write-Host "[提示] 若要在新项目中使用，请将 template/ 下的内容复制到项目根目录：" -ForegroundColor Cyan
Write-Host "  cp -r $ScriptDir/template/* /path/to/your-project/" -ForegroundColor Cyan
Write-Host ""

Write-Host "[ruanjiann-skill v4.0] 安装完成。下次 ZCode 会话将自动加载该技能。" -ForegroundColor Cyan
