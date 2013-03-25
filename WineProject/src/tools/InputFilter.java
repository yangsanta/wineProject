package tools;

public class InputFilter {

	public InputFilter() {};

	public String sizeFomat(String input, int num) {
		 input = input.trim().replace("<", "&lt;").replace(">", "&gt;"); // 如果字串長度超過num則截斷、去除空白
		String output= input;
		if (input.length() > num)
			output = input.trim().substring(0, num);

		return output;
	}

}
