class StrUtil {
  /// 限制文本字数，超出部分显示省略号
  static String limitTextLength(String text, {int maxLength = 20}) {
    if (text.length <= maxLength) {
      return text; 
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
