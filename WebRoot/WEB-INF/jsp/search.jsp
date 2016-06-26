<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>(function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
<title></title>

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

<link rel='stylesheet' id='open-sans-css'
	href='${basePath}css/fonts.css' type='text/css' media='all' />
<link rel='stylesheet' id='dashicons-css'
	href='${basePath}css/dashicons.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='admin-bar-css'
	href='${basePath}css/admin-bar.min.css' type='text/css' media='all' />
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
<style type="text/css" media="print">
#wpadminbar {
	display: none;
}
</style>
<style type="text/css" media="screen">
html {
	margin-top: 32px !important;
}

* html body {
	margin-top: 32px !important;
}

@media screen and ( max-width: 782px ) {
	html {
		margin-top: 46px !important;
	}
	* html body {
		margin-top: 46px !important;
	}
}
</style>
</head>

<body
	class="single single-post postid-8 single-format-standard logged-in admin-bar no-customize-support">
	<s:include value="/common/header.jsp"></s:include>
	<div id="page" class="site">
		<div class="site-inner">

			<div style="height: 30px"></div>
			<div id="content" class="site-content">
				<div id="primary" class="content-area">
					<main id="main" class="site-main" role="main"> <article
						id="post-8"
						class="post-8 post type-post status-publish format-standard hentry category-uncategorized">
					<s:iterator value="#searchs">
						<div style="border-top: 2px solid #F1F1F1; overflow: hidden">
							<h2 >${title}</h2>
							<div>
								<s:a action="article_seeUI?id=%{id}"
									style="float:right">查看全部</s:a>
							</div>
						</div>
					</s:iterator> </article> <!-- #post-## --> </main>
					<!-- .site-main -->
				</div>
				<!-- .content-area -->
				<s:include value="/common/left.jsp"></s:include>
				<!-- .sidebar .widget-area -->
			</div>
			<!-- .site-content -->

			<s:include value="/common/footer.jsp"></s:include>
			<!-- .site-footer -->
		</div>
		<!-- .site-inner -->
	</div>
	<!-- .site -->

	<script type='text/javascript'
		src='http://w0w.site/wp-includes/js/admin-bar.min.js?ver=4.5.2'></script>
	<script type='text/javascript'
		src='http://w0w.site/wp-content/themes/twentysixteen/js/skip-link-focus-fix.js?ver=20151112'></script>
	<script type='text/javascript'
		src='http://w0w.site/wp-includes/js/comment-reply.min.js?ver=4.5.2'></script>
	<script type='text/javascript'>
        /* <![CDATA[ */
        var screenReaderText = { "expand": "\u5c55\u5f00\u5b50\u83dc\u5355", "collapse": "\u6298\u53e0\u5b50\u83dc\u5355" };
        /* ]]>*/</script>
	<script type='text/javascript'
		src='http://w0w.site/wp-content/themes/twentysixteen/js/functions.js?ver=20151204'></script>
	<script type='text/javascript'
		src='http://w0w.site/wp-includes/js/wp-embed.min.js?ver=4.5.2'></script>
	<script type="text/javascript">
        (function () {
            var request, b = document.body, c = 'className', cs = 'customize-support', rcs = new RegExp('(^|\\s+)(no-)?' + cs + '(\\s+|$)');

            request = true;

            b[c] = b[c].replace(rcs, ' ');
            b[c] += (window.postMessage && request ? ' ' : ' no-') + cs;
        }());
    </script>



</body>
</html>