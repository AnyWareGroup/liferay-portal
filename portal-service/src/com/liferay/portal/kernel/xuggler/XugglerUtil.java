/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.portal.kernel.xuggler;

import com.liferay.portal.kernel.security.pacl.permission.PortalRuntimePermission;

/**
 * @author Alexander Chow
 */
public class XugglerUtil {

	public static Xuggler getXuggler() {
		PortalRuntimePermission.checkGetBeanProperty(XugglerUtil.class);

		return _xuggler;
	}

	public static void installNativeLibraries(
			String name, XugglerInstallStatus xugglerInstallStatus)
		throws Exception {

		getXuggler().installNativeLibraries(name, xugglerInstallStatus);
	}

	public static boolean isEnabled() {
		return getXuggler().isEnabled();
	}

	public static boolean isEnabled(boolean checkNativeLibraries) {
		return getXuggler().isEnabled(checkNativeLibraries);
	}

	public static boolean isNativeLibraryInstalled() {
		return getXuggler().isNativeLibraryInstalled();
	}

	public void setXuggler(Xuggler xuggler) {
		PortalRuntimePermission.checkSetBeanProperty(getClass());

		_xuggler = xuggler;
	}

	private static Xuggler _xuggler;

}