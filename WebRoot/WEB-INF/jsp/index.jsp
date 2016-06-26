<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<html lang="zh-CN" class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>(function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
<title>MyBlog &#8211; 私人博客站点</title>
<script type="text/javascript">
        window._wpemojiSettings = { "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/72x72\/", "ext": ".png", "source": { "concatemoji": "http:\/\/w0w.site\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.5.2" } };
        !function (a, b, c) { function d(a) { var c, d, e, f = b.createElement("canvas"), g = f.getContext && f.getContext("2d"), h = String.fromCharCode; if (!g || !g.fillText) return !1; switch (g.textBaseline = "top", g.font = "600 32px Arial", a) { case "flag": return g.fillText(h(55356, 56806, 55356, 56826), 0, 0), f.toDataURL().length > 3e3; case "diversity": return g.fillText(h(55356, 57221), 0, 0), c = g.getImageData(16, 16, 1, 1).data, d = c[0] + "," + c[1] + "," + c[2] + "," + c[3], g.fillText(h(55356, 57221, 55356, 57343), 0, 0), c = g.getImageData(16, 16, 1, 1).data, e = c[0] + "," + c[1] + "," + c[2] + "," + c[3], d !== e; case "simple": return g.fillText(h(55357, 56835), 0, 0), 0 !== g.getImageData(16, 16, 1, 1).data[0]; case "unicode8": return g.fillText(h(55356, 57135), 0, 0), 0 !== g.getImageData(16, 16, 1, 1).data[0] } return !1 } function e(a) { var c = b.createElement("script"); c.src = a, c.type = "text/javascript", b.getElementsByTagName("head")[0].appendChild(c) } var f, g, h, i; for (i = Array("simple", "flag", "unicode8", "diversity"), c.supports = { everything: !0, everythingExceptFlag: !0 }, h = 0; h < i.length; h++) c.supports[i[h]] = d(i[h]), c.supports.everything = c.supports.everything && c.supports[i[h]], "flag" !== i[h] && (c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && c.supports[i[h]]); c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && !c.supports.flag, c.DOMReady = !1, c.readyCallback = function () { c.DOMReady = !0 }, c.supports.everything || (g = function () { c.readyCallback() }, b.addEventListener ? (b.addEventListener("DOMContentLoaded", g, !1), a.addEventListener("load", g, !1)) : (a.attachEvent("onload", g), b.attachEvent("onreadystatechange", function () { "complete" === b.readyState && c.readyCallback() })), f = c.source || {}, f.concatemoji ? e(f.concatemoji) : f.wpemoji && f.twemoji && (e(f.twemoji), e(f.wpemoji))) }(window, document, window._wpemojiSettings);
    </script>
<style type="text/css">
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='genericons-css'
	href='${basePath}css/genericons.css' type='text/css' media='all' />
<link rel='stylesheet' id='twentysixteen-style-css'
	href='${basePath}css/style.css' type='text/css' media='all' />
<script type='text/javascript' src='${basePath}js/jquery.js'></script>
<script type='text/javascript' src='${basePath}js/jquery-migrate.min.js'></script>
<style type="text/css">
.recentcomments a {
	display: inline !important;
	padding: 0 !important;
	margin: 0 !important;
}
</style>
</head>

<body class="home blog hfeed">
	<div id="page" class="site">
		<div class="site-inner">
			<a class="skip-link screen-reader-text" href="#content">跳至内容</a>
			<header id="masthead" class="site-header" role="banner">
				<div class="site-header-main">
					<div class="site-branding">
						<h1 class="site-title">
							<a href="http://w0w.site/" rel="home">MyBlog</a>
						</h1>
						<p class="site-description">私人博客站点</p>
					</div>
					<!-- .site-branding -->

				</div>
				<!-- .site-header-main -->
			</header>
			<!-- .site-header -->

			<div id="content" class="site-content">
				<div id="primary" class="content-area">
					<main id="main" class="site-main" role="main">
					<section class="no-results not-found">
						<header class="page-header">
							<h1 class="page-title">欢迎使用</h1>
						</header>
						<!-- .page-header -->
						<div class="page-content">
							<p>未登录，您可以选择注册或登陆。</p>
							<form role="search" method="post" class="search-form"
								action="article_search.action">
								<label> <span class="screen-reader-text">搜索：</span> <input
									type="search" class="search-field" placeholder="搜索…"
									name="search" title="搜索：" />
								</label>
								<button type="submit" class="search-submit">
									<span class="screen-reader-text">搜索</span>
								</button>
							</form>
						</div>
						<!-- .page-content -->
					</section>
					<!-- .no-results --> </main>
					<!-- .site-main -->
				</div>
				<!-- .content-area -->
				<aside id="secondary" class="sidebar widget-area" role="complementary">
	<section id="search-2" class="widget widget_search">
		<form role="search" method="get" class="search-form"
			action="${basePath}article_search.action">
			<label> <span class="screen-reader-text">搜索：</span> <input
				type="search" class="search-field" placeholder="搜索…" value=""
				name="s" title="搜索：" />
			</label>
			<button type="submit" class="search-submit">
				<span class="screen-reader-text">搜索</span>
			</button>
		</form>
	</section>
	<section id="recent-posts-2" class="widget widget_recent_entries">
		<h2 class="widget-title">近期文章</h2>
		<ul>
		<s:iterator value="#Larticles">
			<li class="cat-item cat-item-1"><s:a
				action="article_seeUI?id=%{id}">${title}</s:a></li>
		</s:iterator>
		</ul>
	</section>
	<section id="meta-2" class="widget widget_meta">
		<h2 class="widget-title">功能</h2>
		<ul>
		<li><a href="${basePath}user_loginUI.action">登录</a></li>
			<li><a href="${basePath}user_registUI.action">注册</a></li>
		</ul>
	</section>
</aside>
				<!-- .sidebar .widget-area -->
			</div>
			<!-- .site-content -->
			<footer id="colophon" class="site-footer" role="contentinfo">
				<div class="site-info">
					<span class="site-title"><a href="http://w0w.site/"
						rel="home">Myblog</a></span> <a href="https://cn.wordpress.org/">私人博客站点</a>
				</div>
				<!-- .site-info -->
			</footer>
			<!-- .site-footer -->
		</div>
		<!-- .site-inner -->
	</div>
	<!-- .site -->
	<script type='text/javascript'
		src='${basePath}js/skip-link-focus-fix.js'></script>
	<script type='text/javascript'>
        var screenReaderText = { "expand": "\u5c55\u5f00\u5b50\u83dc\u5355", "collapse": "\u6298\u53e0\u5b50\u83dc\u5355" };
    </script>
	<script type='text/javascript'
		src='${basePath}js/skip-link-focus-fix.js'></script>
	<script type='text/javascript' src='${basePath}js/wp-embed.min.js'></script>
</body>
</html>