import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/store/controller.dart';
import 'package:iweather_flutter/components/chart/circular_progress.dart';
import 'package:iweather_flutter/components/custom/IGrid.dart';
import 'package:iweather_flutter/components/custom/IContainer.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';
import 'package:iweather_flutter/components/custom/IScaffold.dart';

class AqiPage extends StatelessWidget {
  final Controller controller = Get.find<Controller>();

  AqiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AqiContent(air: (controller.weatherInfo?.air)!),
    );
  }
}

class AqiContent extends StatelessWidget {
  final Air air;

  const AqiContent({Key? key, required this.air}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IScaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '空气质量',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Text('发布时间: ${air.dt}'),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            // 圆形进度条
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(30),
              child: CircularProgress(
                value: 10 / 500,
                valueColor: air.info?.color1,
              ),
            ),
            Column(
              children: [
                Text(
                  '${air.aqi}',
                  style: TextStyle(
                    fontSize: 40,
                    color: air.info?.color1,
                  ),
                ),
                Chip(
                  backgroundColor: air.info?.color1,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  label: Text('${air.info?.category}'),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          // 内部存在 GridView, 这里加一层 Expanded
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '污染物',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IGrid(
                  children: air.components
                      .toList()
                      .map<IContainer>(
                        (e) => IContainer(
                          title: e.name,
                          subTitle: e.unit,
                          value: e.value!,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
