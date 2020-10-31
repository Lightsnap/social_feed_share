
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef Future<dynamic> CancelHandler();
typedef Future<dynamic> ErrorHandler(String error);
typedef Future<dynamic> SuccessHandler(String postId);

class SocialFeedShare {
  static const MethodChannel _channel =
      const MethodChannel('social_feed_share');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> shareToInstagram({
    String type = 'image/*',
    @required String path,
    SuccessHandler onSuccess,
    CancelHandler onCancel,
  }) async {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "onSuccess": {
          return onSuccess(call.arguments);
        }
        case "onCancel": {
          return onCancel();
        }
        default:
          throw UnsupportedError("Unknown method called");
      }
    });

    return _channel.invokeMethod('shareToFeedInstagram', <String, dynamic>{
      'type': type,
      'path': path,
    });
  }

  static Future<void> shareToFacebook({
    String type = 'image/*',
    @required String path,
    SuccessHandler onSuccess,
    CancelHandler onCancel,
  }) async {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "onSuccess": {
          return onSuccess(call.arguments);
        }
        case "onCancel": {
          return onCancel();
        }
        default:
          throw UnsupportedError("Unknown method called");
      }
    });

    return _channel.invokeMethod('shareToFeedFacebook', <String, dynamic>{
      'type': type,
      'path': path,
    });
  }

}
