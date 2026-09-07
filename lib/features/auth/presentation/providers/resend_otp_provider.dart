import 'dart:async';

import 'package:flutter/material.dart';

class ResendOtpProvider extends ChangeNotifier {
  int _resendOtpTimer = 120;
  int get resendOtptimer => _resendOtpTimer;

  Timer? _timer;

  Future<void> startResendOtpTimer() async {
    _timer = null;
    _resendOtpTimer = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_resendOtpTimer > 0) {
        _resendOtpTimer--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _timer = null;
        notifyListeners();
      }
    });
  }

  Future<void> stopResendOtpTimer()async {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
}
