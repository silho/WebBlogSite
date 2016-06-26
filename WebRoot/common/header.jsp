<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="wpadminbar" class="nojq nojs">
<s:if test="#session.SYS_USER!=null">
	<a class="screen-reader-shortcut" href="#wp-toolbar" tabindex="1">跳至工具栏</a>
	<div class="quicklinks" id="wp-toolbar" role="navigation"
		aria-label="工具栏" tabindex="0">
		<ul id="wp-admin-bar-root-default" class="ab-top-menu">
			<li id="wp-admin-bar-site-name" class="menupop"><a
				class="ab-item" href="${basePath}user_index.action">MyBlog</a>
				<div class="ab-sub-wrapper"></div></li>
			<li id="wp-admin-bar-edit"><a class="ab-item"
				href="${basePath}article_addUI.action">新建文章</a></li>
		</ul>
		<ul id="wp-admin-bar-top-secondary"
			class="ab-top-secondary ab-top-menu">
			<li id="wp-admin-bar-search" class="admin-bar-search">
				<div class="ab-item ab-empty-item" tabindex="-1">
					<form action="article_search.action" method="get"
						id="adminbarsearch">
						<input class="adminbar-input" name="search" id="adminbar-search"
							type="text" value="" maxlength="150" /> <label
							for="adminbar-search" class="screen-reader-text">搜索</label> <input
							type="submit" class="adminbar-button" value="搜索" />
					</form>
				</div>
			</li>
			
				<li id="wp-admin-bar-my-account" class="menupop with-avatar"><a
					class="ab-item" aria-haspopup="true"
					href="${basePath}user_index.action"> 您好,<b>${SYS_USER.nickname}</b>
						<img
						src="${basePath}upload/<s:property value='#session.SYS_USER.headImgPath'/>"
						class='avatar avatar-26 photo' height='26' width='26' />
				</a>
					<div class="ab-sub-wrapper">
						<ul id="wp-admin-bar-user-actions" class="ab-submenu">
							<li id="wp-admin-bar-user-info"><a class="ab-item"
								tabindex="-1" href="${basePath}user_index.action"> <img
									src="${basePath}upload/<s:property value='#session.SYS_USER.headImgPath'/>"
									class='avatar avatar-64 photo' height='64' width='64' /> <span
									class='display-name'>${SYS_USER.nickname}</span>
							</a></li>
							<li id="wp-admin-bar-edit-profile"><a class="ab-item"
								href="${basePath}user_index.action">编辑我的个人资料</a></li>
							<li id="wp-admin-bar-logout"><a class="ab-item"
								href="${basePath}user_logout.action">登出</a></li>
						</ul>
					</div></li>
			
		</ul>
	</div>
	</s:if>
</div>

