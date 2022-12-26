import 'dart:math';

class MathUtils {
  /// target  要转换的数字
  /// position 要保留的位数
  /// isCrop  true 直接裁剪 false 四舍五入
  static String formatNum(num target, int position, {bool isCrop = false}) {
    String t = target.toString();
    // 如果要保留的长度小于等于0 直接返回当前字符串
    if (position < 0) {
      return t;
    }
    if (t.contains(".")) {
      String t1 = t.split(".").last;
      if (t1.length >= position) {
        if (isCrop) {
          // 直接裁剪
          return t.substring(0, t.length - (t1.length - position));
        } else {
          // 四舍五入
          return target.toStringAsFixed(position);
        }
      } else {
        // 不够位数的补相应个数的0
        String t2 = "";
        for (int i = 0; i < position - t1.length; i++) {
          t2 += "0";
        }
        return t + t2;
      }
    } else {
      // 不含小数的部分补点和相应的0
      String t3 =  position>0?".":"";

      for (int i = 0; i < position; i++) {
        t3 += "0";
      }
      return t + t3;
    }
  }

  ///获取最高位数+1 后的整数
  ///eg: 17 -> 20   123->200  3241->4000
  static double getDigitsMaxNumber(double sourceNum) {
    //得到这个数是几位数
    int digits = sourceNum.floor().toString().length;
    //得到最高位是几
    int high = int.parse(sourceNum.floor().toString()[0]);
    //得到最大数
    num max = (high + 1) * pow(10, digits-1);
    return max.toDouble();
  }

  //摄氏度转华氏度
  static Object? celsiusToFahrenheit<T>(T celsius) {
    if (celsius is num) {
      return num.parse(formatNum(celsius*1.8 + 32, 1));
    }else if (celsius is String && celsius.isNotEmpty) {
      return formatNum(num.parse(celsius)*1.8 + 32, 1);
    }else {
      return null;
    }
  }

  //制冷量KW转RT
  static Object? kwToRt<T>(T kw) {
    if (kw is num) {
      return num.parse(formatNum(kw/3.517, 1));
    }else if (kw is String && kw.isNotEmpty) {
      return formatNum(num.parse(kw)/3.517, 1);
    }else {
      return null;
    }
  }
}
