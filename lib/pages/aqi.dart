import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/store/controller.dart';
import 'package:iweather_flutter/components/chart/circular_progress.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/components/custom/IGrid.dart';
import 'package:iweather_flutter/components/custom/IContainer.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';

Controller c = Get.find<Controller>();

class AqiPage extends StatelessWidget {
  const AqiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("空气质量"),
      ),
      body: FutureBuilder<WeatherInfo>(
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.data?.air == null) {
            return Container();
          } else {
            return AqiContent(air: snapshot.data!.air!);
          }
        },
        future: c.updateWeatherInfo(),
      ),
    );
  }
}

class AqiContent extends StatelessWidget {
  final Air air;

  const AqiContent({Key? key, required this.air}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // 圆形进度条
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(30),
              child: const CircularProgress(
                value: 10 / 500,
              ),
            ),
            Column(
              children: [
                Text('${air.aqi}', style: const TextStyle(fontSize: 40)),
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
          child: Container(
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
                Text('发布时间: ${air.dt}'),
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
