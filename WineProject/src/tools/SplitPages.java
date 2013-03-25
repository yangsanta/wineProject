package tools;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class SplitPages {
	public SplitPages(){};
	public void splitPages(List<?> list, HttpServletRequest req) {
		int rowsPerPage = 8; // 每頁的筆數
		int rowNumber = list.size(); // 總筆數
		int pageNumber = 0; // 總頁數
		int whichPage = 1; // 第幾頁
		int pageIndexArray[] = null;
		int pageIndex = 0;
		
		req.setAttribute("list", list);
		String url = req.getRequestURI();
		req.setAttribute("url", url);
		req.setAttribute("rowsPerPage", rowsPerPage);
		req.setAttribute("rowNumber", rowNumber);

		if (rowNumber % rowsPerPage != 0) {
			pageNumber = rowNumber / rowsPerPage + 1;
		}

		else {
			pageNumber = rowNumber / rowsPerPage;
		}
		pageIndexArray = new int[pageNumber];
		int pageIndexArray_length = pageIndexArray.length;// 迴圈變數
		for (int i = 1; i <= pageIndexArray_length; i++) {
			pageIndexArray[i - 1] = i * rowsPerPage - rowsPerPage;
			req.setAttribute("pageIndexArray", pageIndexArray);
		}
		
		try {
			whichPage = Integer.parseInt(req.getParameter("whichPage"));
			pageIndex = pageIndexArray[whichPage - 1];
		} catch (NumberFormatException e) {
			whichPage = 1;
			pageIndex = 0;
		} catch (ArrayIndexOutOfBoundsException e) {
			if (pageNumber > 0) {
				whichPage = pageNumber;
				pageIndex = pageIndexArray[whichPage - 1];
			}
		}
		
		req.setAttribute("whichPage", whichPage);
		req.setAttribute("pageIndex", pageIndex);
		req.setAttribute("pageNumber", pageNumber);
		req.setAttribute("rowNumber", rowNumber);
		req.setAttribute("rowsPerPage", rowsPerPage);
	}
}
