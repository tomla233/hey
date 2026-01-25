import 'package:hey/constant/GlobalConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 全局单例
final tokenUtil = TokenUtil();

class TokenUtil {
  TokenUtil._internal();

  static final TokenUtil _instance = TokenUtil._internal();

  factory TokenUtil() => _instance;

  SharedPreferences? _prefs;
  String _token = '';

  // 初始化
  Future<void> _init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
      _token = _prefs?.getString(GlobalConstants.tokenKey) ?? "";
    }
  }

  // 设置token
  Future<void> setToken(String val) async {
    await _init();
    await _prefs?.setString(GlobalConstants.tokenKey, val);
    _token = val;
  }

  // 获取token
  Future<String> getToken() async {
    if (_token.isEmpty) {
      await _init();
      _token = _prefs?.getString(GlobalConstants.tokenKey) ?? "";
    }
    return _token;
  }

  // 删除token
  Future<void> removeToken() async {
    await _init();
    await _prefs?.remove(GlobalConstants.tokenKey);
    _token = "";
  }
}
