import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors Chart'),
        centerTitle: true,
      ),
      body: GetBuilder<ChartController>(
        builder: (_) => Column(
        children: [
          Expanded(
            child:
            SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(),
                title: ChartTitle(text: 'Accelerometer Data'),
                series: <ChartSeries>[
                  LineSeries<DataPoint, DateTime>(
                    dataSource: _.accelerometerData,
                    xValueMapper: (DataPoint data, _) => data.time,
                    yValueMapper: (DataPoint data, _) => data.value,
                  ),
                ],
              ),
          ),
          Expanded(
            child:
            SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(),
                title: ChartTitle(text: 'Gyrometer Data'),
                series: <ChartSeries>[
                  LineSeries<DataPoint, DateTime>(
                    dataSource: _.gyroscopeData,
                    xValueMapper: (DataPoint data, _) => data.time,
                    yValueMapper: (DataPoint data, _) => data.value,
                  ),
                ],
              ),
          ),
          Expanded(
            child:
            SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(),
                title: ChartTitle(text: 'Magneto Data'),
                series: <ChartSeries>[
                  LineSeries<DataPoint, DateTime>(
                    dataSource: _.magnetometerData,
                    xValueMapper: (DataPoint data, _) => data.time,
                    yValueMapper: (DataPoint data, _) => data.value,
                  ),
                ],
              ),
          ),
        ],
      ),)
    );
  }
}
