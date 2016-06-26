<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="wp-toolbar" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>撰写新文章 &lsaquo; MyBlog &#8212; 私人博客站点</title>
    <script type="text/javascript">
        addLoadEvent = function (func) { if (typeof jQuery != "undefined") jQuery(document).ready(func); else if (typeof wpOnload != 'function') { wpOnload = func; } else { var oldonload = wpOnload; wpOnload = function () { oldonload(); func(); } } };
        var ajaxurl = '/wp-admin/admin-ajax.php',
            pagenow = 'post',
            typenow = 'post',
            adminpage = 'post-new-php',
            thousandsSeparator = ',',
            decimalPoint = '.',
            isRtl = 0;
    </script>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
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
    <link rel='stylesheet' href='${basePath}css/write-load-styles.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='thickbox-css' href='${basePath}css/thickbox.css' type='text/css' media='all' />
    <link rel='stylesheet' id='mediaelement-css' href='${basePath}css/mediaelementplayer.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='wp-mediaelement-css' href='${basePath}css/wp-mediaelement.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='imgareaselect-css' href='${basePath}css/imgareaselect.css' type='text/css' media='all' />
    <script type="text/javascript">
        window._wpemojiSettings = { "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/72x72\/", "ext": ".png", "source": { "concatemoji": "http:\/\/w0w.site\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.5.2" } };
        !function (a, b, c) { function d(a) { var c, d, e, f = b.createElement("canvas"), g = f.getContext && f.getContext("2d"), h = String.fromCharCode; if (!g || !g.fillText) return !1; switch (g.textBaseline = "top", g.font = "600 32px Arial", a) { case "flag": return g.fillText(h(55356, 56806, 55356, 56826), 0, 0), f.toDataURL().length > 3e3; case "diversity": return g.fillText(h(55356, 57221), 0, 0), c = g.getImageData(16, 16, 1, 1).data, d = c[0] + "," + c[1] + "," + c[2] + "," + c[3], g.fillText(h(55356, 57221, 55356, 57343), 0, 0), c = g.getImageData(16, 16, 1, 1).data, e = c[0] + "," + c[1] + "," + c[2] + "," + c[3], d !== e; case "simple": return g.fillText(h(55357, 56835), 0, 0), 0 !== g.getImageData(16, 16, 1, 1).data[0]; case "unicode8": return g.fillText(h(55356, 57135), 0, 0), 0 !== g.getImageData(16, 16, 1, 1).data[0] } return !1 } function e(a) { var c = b.createElement("script"); c.src = a, c.type = "text/javascript", b.getElementsByTagName("head")[0].appendChild(c) } var f, g, h, i; for (i = Array("simple", "flag", "unicode8", "diversity"), c.supports = { everything: !0, everythingExceptFlag: !0 }, h = 0; h < i.length; h++) c.supports[i[h]] = d(i[h]), c.supports.everything = c.supports.everything && c.supports[i[h]], "flag" !== i[h] && (c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && c.supports[i[h]]); c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && !c.supports.flag, c.DOMReady = !1, c.readyCallback = function () { c.DOMReady = !0 }, c.supports.everything || (g = function () { c.readyCallback() }, b.addEventListener ? (b.addEventListener("DOMContentLoaded", g, !1), a.addEventListener("load", g, !1)) : (a.attachEvent("onload", g), b.attachEvent("onreadystatechange", function () { "complete" === b.readyState && c.readyCallback() })), f = c.source || {}, f.concatemoji ? e(f.concatemoji) : f.wpemoji && f.twemoji && (e(f.twemoji), e(f.wpemoji))) }(window, document, window._wpemojiSettings);
    </script>

    <script type='text/javascript'>
        /* <![CDATA[ */
        var userSettings = { "url": "\/", "uid": "1", "time": "1466586243", "secure": "" };/* ]]> */
    </script>
    <script type='text/javascript' src='${basePath}js/load-scripts.js'></script>
    <link id="wp-admin-canonical" rel="canonical" href="http://w0w.site/wp-admin/post-new.php" />
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, document.getElementById('wp-admin-canonical').href + window.location.hash);
        }
    </script>
    <script type="text/javascript">var _wpColorScheme = { "icons": { "base": "#82878c", "focus": "#00a0d2", "current": "#fff" } };</script>
    <style type="text/css" media="print">
        #wpadminbar {
            display: none;
        }
    </style>
</head>


<body class="wp-admin wp-core-ui no-js  post-new-php auto-fold admin-bar post-type-post branch-4-5 version-4-5-2 admin-color-fresh locale-zh-cn no-customize-support no-svg">
    <script type="text/javascript">
        document.body.className = document.body.className.replace('no-js', 'js');
    </script>

    <script type="text/javascript">
        (function () {
            var request, b = document.body, c = 'className', cs = 'customize-support', rcs = new RegExp('(^|\\s+)(no-)?' + cs + '(\\s+|$)');

            request = true;

            b[c] = b[c].replace(rcs, ' ');
            b[c] += (window.postMessage && request ? ' ' : ' no-') + cs;
        }());
    </script>

    <div id="wpwrap">
	
        <div id="wpcontent">

            <s:include value="/common/header.jsp"></s:include>

            <div id="wpbody" role="main">
				<div id="wpbody-content" aria-label="主内容" tabindex="0">
					<div class="wrap">
						<s:form action="article_%{id == 0 ? 'add' : 'edit' }"
							method="post">
							<%--hidden --%>
							<s:hidden name="id"></s:hidden>
							<s:hidden name="username" value="%{#session.SYS_USER.username}"></s:hidden>

							<div id="poststuff">
								<div id="post-body" class="metabox-holder columns-2">
									<div id="post-body-content">

										<div id="titlediv">
											<div id="titlewrap">
												<label class="screen-reader-text" id="title-prompt-text"
													for="title">在此输入标题</label> <input type="text"
													value="<s:property value='%{title}'/>" name="title"
													size="30" id="title" spellcheck="true" />

											</div>
										</div>
										<!-- /titlediv -->

										<div id="postdivrich" class="postarea wp-editor-expand">

											<div id="wp-content-wrap"
												class="wp-core-ui wp-editor-wrap html-active has-dfw">

												<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
												<div id="wp-content-editor-container"
													class="wp-editor-container">
													<div id="ed_toolbar" class="quicktags-toolbar"></div>
													<textarea class="wp-editor-area" style="height: 300px"
														cols="40" name="content" id="content"><s:property
															value="%{content}" /></textarea>
													<script type="text/javascript">
														CKEDITOR.replace('content', {
															language : 'zh-cn',
															width : 843,
															height : 400,
															resize_enabled : false
														});
													</script>
												</div>

											</div>
										</div>
										<input type="submit"
											class="button button-primary button-large"
											style="float: right" value="发布" />
									</div>
									<!-- /post-body-content -->

									<div id="postbox-container-1" class="postbox-container">
										<div id="side-sortables" class="meta-box-sortables">
											<div id="categorydiv" class="postbox ">
												<button type="button" class="handlediv button-link"
													aria-expanded="true">
													<span class="screen-reader-text">切换面板：分类目录</span><span
														class="toggle-indicator" aria-hidden="true"></span>
												</button>
												<h2 class='hndle'>
													<span>分类目录</span>
												</h2>
												<div class="inside">
													<div id="taxonomy-category" class="categorydiv">
														<ul id="category-tabs" class="category-tabs">
															<li class="tabs"><a href="#category-all">所有分类目录</a></li>
														</ul>
														<div id="category-pop" class="tabs-panel"
															style="display: none;">
															<ul id="categorychecklist-pop"
																class="categorychecklist form-no-clear">
																<li id="popular-category-1" class="popular-category">
																	<label class="selectit"><input
																		id="in-popular-category-1" type="checkbox" value="1" />未分类</label>
																</li>
															</ul>
														</div>

														<div id="category-all" class="tabs-panel">
															<input type='hidden' name='post_category[]' value='0' />
															<ul id="categorychecklist" data-wp-lists="list:category"
																class="categorychecklist form-no-clear">
																<li id='category-1' class="popular-category"><label
																	class="selectit"><input value="1"
																		type="checkbox" name="post_category[]"
																		id="in-category-1" /> 未分类</label></li>
															</ul>
														</div>
														<div id="category-adder" class="wp-hidden-children">
															
															<a id="category-add-toggle" href="#category-add"
																class="hide-if-no-js taxonomy-add-new"> + 添加新分类目录 </a>
															
															<p id="category-add" class="category-add wp-hidden-child">
																<label class="screen-reader-text" for="newcategory">添加新分类目录</label>
																<input type="text" name="newcategory" id="newcategory"
																	class="form-required form-input-tip" value="新分类目录名"
																	aria-required="true" /> <input type="button"
																	id="category-add-submit"
																	data-wp-lists="add:categorychecklist:category-add"
																	class="button category-add-submit" value="添加新分类目录" />
																<input type="hidden" id="_ajax_nonce-add-category"
																	name="_ajax_nonce-add-category" value="ecd910a153" />
																<span id="category-ajax-response"></span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /post-body -->
								<br class="clear" />
							</div>
							<!-- /poststuff -->
						</s:form>
					</div>



					<script type="text/javascript">
                        try { document.post.title.focus(); } catch (e) { }
                    </script>

					<div class="clear"></div>
				</div>
				<!-- wpbody-content -->
				<div class="clear"></div>
			</div><!-- wpbody -->
            <div class="clear"></div>
        </div><!-- wpcontent -->

        <div id="wpfooter" role="contentinfo">
            <p id="footer-left" class="alignleft"><span id="footer-thankyou">感谢使用MyBlog进行创作。</span>	</p>
            <div class="clear"></div>
        </div>


        <!--[if lte IE 8]>
        <style>
            .attachment:focus {
                outline: #1e8cbe solid;
            }
            .selected.attachment {
                outline: #1e8cbe solid;
            }
        </style>
        <![endif]-->
        <script type="text/html" id="tmpl-media-frame">
            <div class="media-frame-menu"></div>
            <div class="media-frame-title"></div>
            <div class="media-frame-router"></div>
            <div class="media-frame-content"></div>
            <div class="media-frame-toolbar"></div>
            <div class="media-frame-uploader"></div>
        </script>

        <script type="text/html" id="tmpl-uploader-editor">
            <div class="uploader-editor-content">
                <div class="uploader-editor-title">拖文件至此可上传</div>
            </div>
        </script>

        <script type="text/html" id="tmpl-crop-content">
            <img class="crop-image" src="{{ data.url }}" alt="">
            <div class="upload-errors"></div>
        </script>
        <script type='text/javascript'>list_args = { "class": "WP_Post_Comments_List_Table", "screen": { "id": "post", "base": "post" } };</script>
        <script type='text/javascript' src='${basePath}js/load-scripts_2.js'></script>
        <script type='text/javascript' src='${basePath}js/tinymce.min.js'></script>
        <script type='text/javascript' src='${basePath}js/plugin.min.js'></script>
        <div class="clear"></div>
    </div><!-- wpwrap -->
    <script type="text/javascript">if (typeof wpOnload == 'function') wpOnload();</script>
</body>
</html>
