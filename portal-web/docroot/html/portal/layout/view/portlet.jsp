<%
/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/html/portal/init.jsp" %>

<liferay-portlet:runtime portletName="<%= PortletKeys.TAGS_COMPILER %>" />

<%
boolean layoutMaximized = layoutTypePortlet.hasStateMax();

if (!layoutMaximized) {
	String content = LayoutTemplateLocalUtil.getContent(layoutTypePortlet.getLayoutTemplateId(), false, theme.getThemeId());
%>

	<%= RuntimePortletUtil.processTemplate(application, request, response, content) %>

<%
}
else {
	String content = null;

	if (themeDisplay.isStateExclusive()) {
		content = LayoutTemplateLocalUtil.getContent("exclusive", true, theme.getThemeId());
	}
	else if (themeDisplay.isStatePopUp()) {
		content = LayoutTemplateLocalUtil.getContent("pop_up", true, theme.getThemeId());
	}
	else {
		content = LayoutTemplateLocalUtil.getContent("max", true, theme.getThemeId());
	}
%>

	<%= RuntimePortletUtil.processTemplate(application, request, response, StringUtil.split(layoutTypePortlet.getStateMax())[0], content) %>

<%
}
%>

<c:if test="<%= themeDisplay.isSignedIn() && !layoutMaximized %>">
	<liferay-portlet:runtime portletName="<%= PortletKeys.PORTLET_CSS %>" />
</c:if>