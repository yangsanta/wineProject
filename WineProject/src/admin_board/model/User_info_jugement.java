package admin_board.model;

import hibernate.util.HibernateUtil;

import org.hibernate.Session;

public class User_info_jugement {

	public String judgeOs(String userAgent) {
		if (userAgent.contains("Windows NT 6.2")) {// Windows 8
			return "Windows8";
		} else if (userAgent.contains("Windows NT 6.1")) {// Windows 7
			return "Windows7";
		} else if (userAgent.contains("Windows NT 6.0")) {// Windows Vista
			return "WindowsVista";
		} else if (userAgent.contains("Windows NT 5.2")) {// Windows XP x64
															// Edition
			return "WindowsXP x64 Edition";
		} else if (userAgent.contains("Windows NT 5.1")) {// Windows XP
			return "WindowsXP";
		} else if (userAgent.contains("Windows NT 5.01")) {// Windows 2000,
															// Service Pack 1
															// (SP1)
			return "Windows2000 SP1";
		} else if (userAgent.contains("Windows NT 5.0")) {// Windows 2000
			return "Windows2000";
		} else if (userAgent.contains("Windows NT 4.0")) {// Microsoft Windows
															// NT 4.0
			return "WindowsNT 4.0";
		} else if (userAgent.contains("Windows 98; Win 9x 4.90")) {// Windows
																	// Millennium
																	// Edition
																	// (Windows
																	// Me)
			return "WindowsME";
		} else if (userAgent.contains("Windows 98")) {// Windows 98
			return "Windows98";
		} else if (userAgent.contains("Windows 95")) {// Windows 95
			return "Windows95";
		} else if (userAgent.contains("Windows CE")) {// Windows CE
			return "WindowsCE";
		} else if (userAgent.contains("Mac OS X")) {

			if (userAgent.contains("iPhone OS 5_0")) {
				return "iPhone 5";// 判斷瀏覽器
			} else if (userAgent.contains("iPhone OS 4_0 ")) {// Windows CE
				return "iPhone 4";
			} else if (userAgent.contains("iPad")) {// Windows CE
				return "iPad";
			} else
				return "mac";
		}

		// Android 2.2
		else if (userAgent.contains(" Android 4")) {// Android 2.2
			return "Android 4";
		} else if (userAgent.contains("Android 3")) {// Android 2.2
			return "Android 3";
		} else if (userAgent.contains("Android 2")) {// Android 2.2
			return "Android 2";
		} else if (userAgent.contains("Android 1")) {// Android 2.2
			return "Android 1";
		} else if (userAgent.contains("Android")) {// Android 2.2
			return "Android 系列";
		}
		return null;

	}

	public String judgeBrowser(String userAgent) {
		if (userAgent.contains("Chrome")) {
			/**
			 * *********** Chrome 系列 *********** Chrome 24.0.1295.0 -
			 * Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.15 (KHTML,
			 * like Gecko) Chrome/24.0.1295.0 Safari/537.15 Chrome 24.0.1292.0 -
			 * Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.14 (KHTML,
			 * like Gecko) Chrome/24.0.1292.0 Safari/537.14 Chrome 24.0.1290.1 -
			 * Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.13
			 * (KHTML, like Gecko) Chrome/24.0.1290.1 Safari/537.13
			 * 判斷依據:http://www.useragentstring.com/pages/Chrome/
			 */
			String temp = userAgent.substring(userAgent.indexOf("Chrome/") + 7);// 拿到User
																				// Agent
																				// String
																				// "Chrome/"
																				// 之後的字符串,結果形如"24.0.1295.0 Safari/537.15"或"24.0.1295.0"
			String chromeVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"24.0.1295.0"
				chromeVersion = temp;
			} else {// temp形如"24.0.1295.0 Safari/537.15"
				chromeVersion = temp.substring(0, temp.indexOf(" "));
			}
			return "Chrome" + chromeVersion;
		} else if (userAgent.contains("Firefox")) {
			/**
			 * ******* FF 系列 ******* Firefox 16.0.1 - Mozilla/5.0 (Windows NT
			 * 6.2; Win64; x64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1 Firefox
			 * 15.0a2 - Mozilla/5.0 (Windows NT 6.1; rv:15.0) Gecko/20120716
			 * Firefox/15.0a2 Firefox 15.0.2 - Mozilla/5.0 (Windows NT 6.2;
			 * WOW64; rv:15.0) Gecko/20120910144328 Firefox/15.0.2
			 * 判斷依據:http://www.useragentstring.com/pages/Firefox/
			 */
			String temp = userAgent
					.substring(userAgent.indexOf("Firefox/") + 8);// 拿到User
																	// Agent
																	// String
																	// "Firefox/"
																	// 之後的字符串,結果形如"16.0.1 Gecko/20121011"或"16.0.1"
			String ffVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"16.0.1"
				ffVersion = temp;
			} else {// temp形如"16.0.1 Gecko/20121011"
				ffVersion = temp.substring(0, temp.indexOf(" "));
			}
			return "Firefox" + ffVersion;
		} else if (userAgent.contains("MSIE")) {
			/**
			 * ******* IE 系列 ******* MSIE 10.0 - Internet Explorer 10 MSIE 9.0 -
			 * Internet Explorer 9 MSIE 8.0 - Internet Explorer 8 or IE8
			 * Compatibility View/Browser Mode MSIE 7.0 - Windows Internet
			 * Explorer 7 or IE7 Compatibility View/Browser Mode MSIE 6.0 -
			 * Microsoft Internet Explorer 6
			 * 判斷依據:http://msdn.microsoft.com/en-us
			 * /library/ms537503(v=vs.85).aspx
			 */
			if (userAgent.contains("MSIE 10.0")) {// Internet Explorer 10
				return "Internet Explorer 10";
			} else if (userAgent.contains("MSIE 9.0")) {// Internet Explorer 9
				return "Internet Explorer 9";
			} else if (userAgent.contains("MSIE 8.0")) {// Internet Explorer 8
				return "Internet Explorer 8";
			} else if (userAgent.contains("MSIE 7.0")) {// Internet Explorer 7
				return "Internet Explorer 7";
			} else if (userAgent.contains("MSIE 6.0")) {// Internet Explorer 6
				return "Internet Explorer 6";
			}
		} else if (userAgent.contains("Safari")) {
			return "Safari";
		} else {
			return null;
		}
		return null;

	}
}
