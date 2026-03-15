const GROQ_API_BASE = 'https://api.groq.com';

export default async function handler(request) {
  // 只允许 POST 请求
  if (request.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 });
  }

  try {
    const url = new URL(request.url);
    const path = url.pathname;

    // 转换路径：/v1/ → /openai/v1/
    let targetPath = path;
    if (targetPath.startsWith('/v1/')) {
      targetPath = '/openai' + targetPath;
    }

    const targetUrl = `${GROQ_API_BASE}${targetPath}${url.search}`;

    console.log(`Forwarding to: ${targetUrl}`);

    // 复制请求头
    const headers = new Headers(request.headers);

    // 添加关键头信息
    headers.set('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36');
    headers.set('Accept', 'application/json');
    headers.set('Accept-Language', 'en-US,en;q=0.9');
    headers.set('Accept-Encoding', 'gzip, deflate, br');
    headers.set('Referer', 'https://groq.com/');
    headers.set('Origin', 'https://groq.com');

    // 直接转发请求
    const response = await fetch(targetUrl, {
      method: 'POST',
      headers,
      body: request.body,
    });

    // 处理 CORS
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'Access-Control-Max-Age': '86400',
    };

    // 返回响应
    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: {
        ...Object.fromEntries(response.headers.entries()),
        ...corsHeaders,
      },
    });

  } catch (error) {
    console.error('Proxy error:', error);

    return new Response(
      JSON.stringify({
        error: 'Proxy error',
        message: error.message,
      }),
      {
        status: 500,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      }
    );
  }
}

// 支持 OPTIONS 预检请求
export async function OPTIONS(request) {
  return new Response(null, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'Access-Control-Max-Age': '86400',
    },
  });
}

// 配置 Edge Runtime
export const config = {
  runtime: 'edge',
};
