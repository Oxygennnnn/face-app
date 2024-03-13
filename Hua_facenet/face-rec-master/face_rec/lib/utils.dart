class API {
  static String rootUrl = 'http://39.103.167.15:5950/accounts';
  // static String rootUrl = 'http://10.0.2.2:8000/accounts';
  static String userUrl = '$rootUrl/user';
  static String organizationUrl = '$rootUrl/organization';
  static String testimgUrl = '$rootUrl/testimg';
}


  bool checkphone(String input) {
    if (input.isEmpty) return false;
    //手机正则验证
    String regexPhoneNumber =
        "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regexPhoneNumber).hasMatch(input);
  }

  bool checkemail(String input) {
    if (input.isEmpty) return false;
    // 邮箱正则
    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    return RegExp(regexEmail).hasMatch(input);
  }

  bool checkStringLength(String input, int length) {
    if (input.isEmpty) return false;
    return input.length >= length;
  }

