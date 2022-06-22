class VerifyUtils {

  //手机正则验证
  static bool isMobileNumber(String input) {
    if (input.isEmpty) return false;
    String regexString = "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regexString).hasMatch(input);
  }

  // 邮箱判断
  static bool isEmail(String input) {
    if (input.isEmpty) return false;
    String regexEmail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$";
    return  RegExp(regexEmail).hasMatch(input);
  }

  //密码  8~20位包含大小写
  static bool checkPassword(String input) {
    if (input.isEmpty) return false;
    if (input.length < 8 || input.length > 20) return false;
    String regexString = "^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8,20}\$";
    return RegExp(regexString).hasMatch(input);
  }
}