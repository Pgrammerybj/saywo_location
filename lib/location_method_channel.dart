import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'location_platform_interface.dart';

/// An implementation of [FlutterZLocationPlatform] that uses method channels.
class MethodChannelLocation extends LocationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('saywo_location');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map<dynamic, dynamic>> getCoordinate(int accuracy) async {
    final res = await methodChannel.invokeMethod<Map<dynamic, dynamic>>('getCoordinate', {"accuracy": accuracy});
    return res ?? {};
  }

  @override
  Future<Map<dynamic, dynamic>> requestPermission() async {
    final res = await methodChannel.invokeMethod<Map<dynamic, dynamic>>('requestPermission');
    return res ?? {};
  }
}
