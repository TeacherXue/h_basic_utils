import 'dart:convert';
import 'package:crypto/crypto.dart';

class StringUtils {

  //解决字符串省略提前太多问题
  static String breakWord(String word){
    if(word.isEmpty){
      return word;
    }
    String breakWord = ' ';
    for (var element in word.runes) {
      breakWord += String.fromCharCode(element);
      breakWord +='\u200B';
    }
    return breakWord;
  }

  //md5加密
  static String generateMD5(String data) {
    var bytes = utf8.encode(data); // data being hashed
    var digest = md5.convert(bytes);
    return digest.toString();
  }
}