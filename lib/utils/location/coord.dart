// 经纬度坐标
class Coord {
  late num latitude;
  late num longitude;
  late String? address; // 坐标详细地址
  late String? city; // 坐标城市

  Coord({
    required this.latitude,
    required this.longitude,
    this.address,
    this.city,
  });

  @override
  String toString() {
    return "{lat: $latitude, lon: $longitude, address: $address, city: $city}";
  }
}
