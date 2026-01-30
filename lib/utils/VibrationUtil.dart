import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VibrationUtil {
  VibrationUtil._();

  static Future<void> lightVibrate({int duration = 50}) async {
    try {
      // 检查设备是否支持震动
      bool? hasVibrator = await Vibration.hasAmplitudeControl();
      if (hasVibrator == true) {
        if (await Vibration.hasAmplitudeControl()) {
          // Android：振幅1表示最弱的震动
          Vibration.vibrate(duration: 50, amplitude: 1);
        } else {
          // iOS/其他设备
          Vibration.vibrate(duration: 50);
        }
      }
    } catch (e) {
      debugPrint('震动失败: $e');
    }
  }
}
