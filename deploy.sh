#!/bin/bash

echo "=" "60"
echo "Vercel Edge Functions 部署指南"
echo "=" "="
echo ""

echo "Groq API 代理项目已创建："
echo "  位置: /home/admin/.openclaw/workspace/vercel-groq-proxy"
echo ""

echo "=" "=" "=" "=" "="
echo "部署方法（选择一个）"
echo "=" "=" "=" "=" "="
echo ""

echo "方法 1: 通过 Vercel CLI（推荐）"
echo " - 已安装 Vercel CLI: $(which vercel 2>/dev/null || echo '未安装，需要先安装')"
echo " - 步骤："
echo "   1. npm install -g vercel"
echo "   2. vercel login"
echo "   3. cd /home/admin/.openclaw/workspace/vercel-groq-proxy"
echo "   4. vercel"
echo ""

echo "方法 2: 通过 GitHub + Vercel Dashboard"
echo " - 步骤："
echo "   1. 创建 GitHub 仓库"
echo "   2. 将代码推送到 GitHub"
echo "   3. 访问 https://vercel.com/new"
echo "   4. 导入项目并部署"
echo ""

echo "=" "=" "=" "=" "="
echo "部署完成后"
echo "=" "=" "=" "=" "="
echo ""

echo "1. 你会得到一个 URL，类似："
echo "   https://groq-proxy-xxxxx.vercel.app"
echo ""

echo "2. 把这个 URL 发给我，格式如下："
echo "   Vercel URL: https://groq-proxy-xxxxx.vercel.app"
echo ""

echo "3. 我会："
echo "   ✓ 更新 OpenClaw 配置"
echo "   ✓ 测试连接"
echo "   ✓ 验证 Groq API"
echo ""

echo "4. 如果成功，就解决了区域限制问题！"
echo ""

echo "=" "="
echo "文件内容预览"
echo "=" "="
echo ""

echo "API 代理代码："
echo "  /home/admin/.openclaw/workspace/vercel-groq-proxy/api/proxy.js"
echo ""

echo "项目配置："
echo "  /home/admin/.openclaw/workspace/vercel-groq-proxy/package.json"
echo ""

echo "详细说明："
echo "  /home/admin/.openclaw/workspace/vercel-groq-proxy/README.md"
echo ""

echo "=" "="
echo "开始部署"
echo "=" "="
echo ""

if which vercel > /dev/null 2>&1; then
    echo "✅ Vercel CLI 已安装"
    echo ""
    echo "可以直接运行："
    echo "cd /home/admin/.openclaw/workspace/vercel-groq-proxy && vercel"
    echo ""
else
    echo "❌ Vercel CLI 未安装"
    echo ""
    echo "请先安装："
    echo "npm install -g vercel"
    echo ""
fi

echo "=" "=" "="
echo "提示"
echo "=" "=" "="
echo ""

echo "1. Vercel 免费额度：每月 100GB 带宽"
echo "2. Edge Function 可能有 50-200ms 冷启动"
echo "3. 如果 Vercel 也被屏蔽，可以尝试："
echo "   - Netlify Edge Functions"
echo "   - Render.com"
echo "   - Railway.app"
echo ""

echo "5. 如果 Vercel 也打不开，我建议直接使用 OpenRouter"
echo "   URL: https://openrouter.ai/keys"
echo "   - 无区域限制"
echo "   - 5分钟配置"
echo "   - 更稳定可靠"
echo ""

echo "=" "= 60"
