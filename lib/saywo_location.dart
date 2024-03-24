library saywo_location;

import 'location_platform_interface.dart';
import 'geocode_entity.dart';
import 'geocode_util.dart';
import 'gps_entity.dart';

export 'common_util.dart';
export 'saywo_location.dart';
export 'geocode_entity.dart';
export 'gps_entity.dart';

class SayWoLocation {
  SayWoLocation._();

  ///
  static Future<String?> getPlatformVersion() {
    return LocationPlatform.instance.getPlatformVersion();
  }

  /// gps获取经纬度
  ///
  /// [accuracy] 定位精度,默认为2(粗略位置):
  /// 1-准确位置(android对应-ACCURACY_FINE, iOS对应-kCLLocationAccuracyBest)
  /// 2-粗略位置(android对应-ACCURACY_COARSE, iOS对应-kCLLocationAccuracyKilometer)
  ///
  static Future<GpsEntity> getCoordinate({int accuracy = 2}) async {
    final json = await LocationPlatform.instance.getCoordinate(accuracy);
    final data = GpsEntity.fromMap(json);
    return data;
  }

  /// 经纬度地理反编码
  static Future<GeocodeEntity> geocodeCoordinate(double lat, double lon, {String pathHead = 'packages/saywo_location/assets/'}) async {
    final res = await GeocodeUtil.geocodeGPS(lat, lon, pathHead: pathHead);
    return res;
  }
}
