import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';

class RekapitulasiScreen extends StatelessWidget {
  const RekapitulasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: AppColors.softBlue,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.run_circle),
              ),
              Tab(
                icon: Icon(Icons.article),
              ),
              Tab(
                icon: Icon(Icons.location_city),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            kegiatan(context),
            posting(context),
            satker(context),
          ],
        ),
      ),
    );
  }

  Container kegiatan(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () async {
                await showDateRangePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  firstDate: DateTime(2012),
                  lastDate: DateTime(2040),
                );
              },
              child: const Text("Pilih Kegiatan"),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Jumlah Kegiatan",
                style: TextStyleConstants.kHeading3,
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': 'Joko', 'measure': 3},
                          {'domain': 'Anwar', 'measure': 14},
                          {'domain': 'Tuti', 'measure': 19},
                          {'domain': 'Asri', 'measure': 0.3},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 8,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => barData['measure'] >= 4
                        ? Colors.green.shade300
                        : Colors.green.shade700,
                    barValue: (barData, index) => '${barData['measure']}',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.auto,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 74,
            ),
            Text(
              "Keterangan Kegiatan",
              style: TextStyleConstants.kHeading6,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Tuti menjadi yang tertinggi yaitu 19 kegiatan",
              style: TextStyleConstants.kBody2,
            ),
          ],
        ),
      ),
    );
  }

  Container posting(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () async {
                await showDateRangePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  firstDate: DateTime(2012),
                  lastDate: DateTime(2040),
                );
              },
              child: const Text("Pilih Posting"),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Jumlah Posting",
                style: TextStyleConstants.kHeading3,
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': 'Posting', 'measure': 120},
                          {'domain': 'Like', 'measure': 10},
                          {'domain': 'Komen', 'measure': 40},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 8,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => barData['measure'] >= 4
                        ? Colors.green.shade300
                        : Colors.green.shade700,
                    barValue: (barData, index) => '${barData['measure']}',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.auto,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 74,
            ),
            Text(
              "Keterangan Kegiatan",
              style: TextStyleConstants.kHeading6,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Ini adalah halaman postingan",
              style: TextStyleConstants.kBody2,
            ),
          ],
        ),
      ),
    );
  }

  Container satker(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () async {
                await showDateRangePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  firstDate: DateTime(2012),
                  lastDate: DateTime(2040),
                );
              },
              child: const Text("Pilih Kegiatan Satker"),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Jumlah Kegiatan Satker",
                style: TextStyleConstants.kHeading3,
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': 'Bekasi', 'measure': 120},
                          {'domain': 'Jakarta', 'measure': 10},
                          {'domain': 'Bandung', 'measure': 40},
                          {'domain': 'Bogor', 'measure': 40},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 8,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => barData['measure'] >= 4
                        ? Colors.green.shade300
                        : Colors.green.shade700,
                    barValue: (barData, index) => '${barData['measure']}',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.auto,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 74,
            ),
            Text(
              "Keterangan Kegiatan",
              style: TextStyleConstants.kHeading6,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Ini adalah halaman postingan",
              style: TextStyleConstants.kBody2,
            ),
          ],
        ),
      ),
    );
  }
}
