import 'package:get/get.dart' show GetPage;
import 'package:iweather_flutter/pages/cities.dart';
import 'package:iweather_flutter/pages/home.dart';
import 'package:iweather_flutter/pages/aqi.dart';
import 'package:iweather_flutter/pages/search.dart';

class Routers {
  static const String homePage = "/";
  static const String cityPage = "/cities";
  static const String searchPage = "/search";
  static const String aqiPage = "/aqi";

  static List<GetPage> getPage() {
    return [
      GetPage(
        name: homePage,
        page: () => const HomePage(), // 首页
      ),
      GetPage(
        name: cityPage,
        page: () => CityPage(), // 城市管理
      ),
      GetPage(
        name: searchPage,
        page: () => SearchPage(), // 城市搜索
      ),
      GetPage(
        name: aqiPage,
        page: () => AqiPage(), // 城市搜索
      ),
    ];
  }
}
