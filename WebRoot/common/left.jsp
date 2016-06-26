<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<aside id="secondary" class="sidebar widget-area" role="complementary">
	<section id="search-2" class="widget widget_search">
		<form role="search" method="post" class="search-form"
			action="${basePath}article_search.action">
			<label> <span class="screen-reader-text">搜索：</span> <input
				type="search" class="search-field" placeholder="搜索…" value=""
				name="search" title="搜索：" />
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
	<s:if test="#session.SYS_USER!=null">
	<section id="categories-2" class="widget widget_categories">
		<h2 class="widget-title">分类目录</h2>
		<ul>
			<s:iterator value="#myarticleClasss">
				<li class="cat-item cat-item-1"><a
					href="${basePath}user_index.action?id=%{id}">${name}</a></li>
			</s:iterator>
		</ul>
	</section>
	</s:if>
	<section id="meta-2" class="widget widget_meta">
		<h2 class="widget-title">功能</h2>
		<ul>
			<s:if test="#session.SYS_USER!=null">
				<li><a href="${basePath}user_logout.action">登出</a></li>
			</s:if>
			<s:else>
				<li><a href="${basePath}user_loginUI.action">登录</a></li>
				<li><a href="${basePath}user_registUI.action">注册</a></li>
			</s:else>
		</ul>
	</section>
</aside>