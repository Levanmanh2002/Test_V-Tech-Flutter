import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_v_tech/screen/home/home_controller.dart';
import 'package:test_v_tech/utils/theme/base_theme_data.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({this.baseTheme, super.key});

  final BaseThemeData? baseTheme;

  @override
  Widget build(BuildContext context) {
    const int numberOfDots = 24;
    const int numberOfDotsRelax = 28;
    const int numberOfDotsClearMind = 32;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BaseThemeData.transparentColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Training',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: BaseThemeData.blackColor,
          ),
        ),
        actions: [
          Icon(Icons.play_arrow, color: BaseThemeData.blackColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.more_vert, color: BaseThemeData.blackColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 50),
          color: BaseThemeData.grey300Color,
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTrainingWidget('Calming', false, false, false, numberOfDots),
              _buildTrainingWidget('Relax', true, false, true, numberOfDotsRelax),
              _buildTrainingWidget('Clear Mind', true, true, false, numberOfDotsClearMind),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrainingWidget(
    String title,
    bool showRightDots,
    bool showBottomDots,
    bool showRightDotsNumber,
    int numberOfDots,
  ) {
    return Stack(
      children: [
        Center(
          child: Icon(Icons.play_arrow, size: 200, color: BaseThemeData.grey400Color),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: BaseThemeData.blackColor),
              ),
            ),
            Expanded(
              child: Center(
                child: CustomPaint(
                  painter: CalmingPainter(showRightDots, showBottomDots),
                  child: Container(),
                ),
              ),
            ),
            const Text(
              '7 00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: List.generate(
                numberOfDots,
                (index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BaseThemeData.deepPurpleColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (showRightDots && showRightDotsNumber)
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                8,
                (index) => InkWell(
                  onTap: () {
                    controller.toggleSelection(index);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.selectedStates[index]
                              ? BaseThemeData.deepPurpleColor
                              : BaseThemeData.greyColor,
                        ),
                        child: Text(
                          String.fromCharCode('A'.codeUnitAt(0) + index),
                          style: TextStyle(fontSize: 16, color: BaseThemeData.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class CalmingPainter extends CustomPainter {
  CalmingPainter(this.isRelax, this.isClearMind);

  final bool isRelax;
  final bool isClearMind;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    final Offset center = Offset(size.width / 4, size.height / 2);

    // Vẽ chấm tròn trên cùng (sát vào tường)
    final double topCircleY = -size.height / 50 + 100.0;
    paint.color = BaseThemeData.deepPurple100Color;
    canvas.drawCircle(center.translate(-80, topCircleY + 20), 10.0, paint);

    // Vẽ đường chéo lên trên, giới hạn chiều dài là 200
    const double lineLength = 200;
    const double angle = pi / 2.2;
    final double endX = center.dx - lineLength * cos(angle);
    final double endY = center.dy - lineLength * sin(angle);
    paint.color = BaseThemeData.deepPurple100Color;
    canvas.drawLine(
      center.translate(-75, topCircleY),
      Offset(endX - 5, endY + 20),
      paint,
    );

    // Vẽ chấm tròn ở đuôi đường chéo
    paint.color = BaseThemeData.deepPurple200Color;
    canvas.drawCircle(
      Offset(endX, endY),
      10.0,
      paint,
    );

    // Vẽ đường ngang từ chấm tròn ở đuôi đường chéo
    final double secondCircleX = endX + 100;
    paint.color = BaseThemeData.deepPurple200Color;
    isRelax == true
        ? null
        : canvas.drawLine(
            Offset(endX + 20, endY),
            Offset(secondCircleX, endY),
            paint,
          );

    // Vẽ chấm tròn thứ hai ở cuối đường ngang
    paint.color = BaseThemeData.deepPurple200Color;
    isRelax == true
        ? null
        : canvas.drawCircle(
            Offset(secondCircleX + 20, endY),
            10.0,
            paint,
          );

    // Vẽ đường chéo xuống dưới, giới hạn chiều dài là 300
    const double diagonalLineLength = 300;
    final double diagonalEndX = secondCircleX + diagonalLineLength * cos(angle / (isClearMind == true ? 1.5 : 1.1));
    final double diagonalEndY = endY + diagonalLineLength * sin(angle);
    paint.color = BaseThemeData.deepPurple300Color;
    canvas.drawLine(
      Offset(
        secondCircleX +
            (isRelax == true
                ? isClearMind == true
                    ? -80
                    : -90
                : 26),
        endY + 20,
      ),
      Offset(
          diagonalEndX -
              (isRelax == true
                  ? isClearMind == true
                      ? 15
                      : 12
                  : 5),
          diagonalEndY - 20),
      paint,
    );

    // Vẽ chấm tròn thứ ba ở cuối đường chéo xuống dưới
    paint.color = BaseThemeData.deepPurple300Color;
    canvas.drawCircle(
      Offset(diagonalEndX, diagonalEndY),
      10.0,
      paint,
    );

    // Vẽ đường ngang từ chấm tròn thứ ba
    final double fourthCircleX = diagonalEndX + 100;
    paint.color = BaseThemeData.deepPurple400Color;
    (isClearMind == true)
        ? null
        : canvas.drawLine(
            Offset(diagonalEndX + 20, diagonalEndY),
            Offset(fourthCircleX - 20, diagonalEndY),
            paint,
          );

    // Vẽ chấm tròn thứ tư ở cuối đường ngang
    paint.color = BaseThemeData.deepPurple400Color;
    (isClearMind == true)
        ? null
        : canvas.drawCircle(
            Offset(fourthCircleX, diagonalEndY),
            10.0,
            paint,
          );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
