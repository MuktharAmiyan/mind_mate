import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_mate/ui/core/enums/mood.dart';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:mind_mate/ui/core/themes/colors.dart';

class MoodSelectorPicker extends StatelessWidget {
  final Mood value;
  final ValueChanged<Mood> onChange;
  const MoodSelectorPicker({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 142.0;

    final center = Offset(radius, radius);
    Future<List<ui.Image>> loadImage() async {
      List<ui.Image> images = [];
      for (var element in Mood.values) {
        final data = await rootBundle.load(element.imagePath);
        final codec = await ui.instantiateImageCodec(
          data.buffer.asUint8List(),
          targetHeight: CircleItemSelectorPainter.imageSize,
          targetWidth: CircleItemSelectorPainter.imageSize,
        );
        final frame = await codec.getNextFrame();
        images.add(frame.image);
      }

      return images;
    }

    Widget buildBackgroundElements() => LayoutBuilder(
      builder: (context, constraints) {
        final size = Size.square(500);
        return FutureBuilder(
          future: loadImage(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return CustomPaint(
                size: size,
                painter: CircleItemSelectorPainter(
                  selectedItem: value,
                  itemRadius: 35,
                  image: asyncSnapshot.requireData,
                ),
              );
            }
            return SizedBox();
          },
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        children: [
          Positioned.fill(child: buildBackgroundElements()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                for (var e in Mood.values) ...[
                  ClipPath(
                    clipper: ArcClipper(
                      startAngle: (e.index * Mood.sweepAngle) + 45,
                      sweepAngle: Mood.sweepAngle,
                    ),
                    child: GestureDetector(
                      onTap: () => onChange(e),
                      child: CircleAvatar(
                        radius: radius,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final angleDeg =
                          (e.index * Mood.sweepAngle + Mood.sweepAngle / 2) +
                          45;
                      final angleRad = angleDeg * pi / 180;

                      final paddingFactor = 0.68;
                      final edgeOffset = Offset(
                        center.dx + radius * paddingFactor * cos(angleRad),
                        center.dy + radius * 0.80 * sin(angleRad),
                      );

                      return Positioned(
                        left:
                            edgeOffset.dx -
                            30, // adjust horizontal centering if needed
                        top:
                            edgeOffset.dy -
                            10, // adjust vertical centering if needed
                        child: IgnorePointer(
                          child: Text(
                            e.name.toUpperCase(),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: e.color,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: Stack(
                  children: [
                    for (var e in Mood.values) ...[
                      ClipPath(
                        clipper: ArcClipper(
                          startAngle: (e.index * Mood.sweepAngle) + 45,
                          sweepAngle: Mood.sweepAngle,
                        ),
                        child: CircleAvatar(
                          radius: radius - 80,
                          backgroundColor: e.color,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: Card(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Mood',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          value.name.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: value.color,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleItemSelectorPainter extends CustomPainter {
  final Mood selectedItem;

  final double itemRadius;

  final List<ui.Image> image;
  CircleItemSelectorPainter({
    required this.selectedItem,

    this.itemRadius = 35.0,

    required this.image,
  });

  static const startAngle = -5 * pi / 6;
  static const endAngle = -pi / 6;
  static const sweepAngle = endAngle - startAngle;
  static const imageSize = 40;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final innerRadius = size.width / 2.68;
    final color = selectedItem.color;
    final arcPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final innerCirclePaint = Paint()
      ..color = color
      ..strokeWidth = 4.5
      ..style = PaintingStyle.stroke;

    final neckPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final innerFilledCirclePaint = Paint()
      ..color = AppColors.surfaceContainerColor.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    // Draw dashed outer arc
    const dash = pi / 100;

    double angle = startAngle;
    while (angle < endAngle) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: outerRadius),
        angle,
        dash,
        false,
        arcPaint,
      );
      angle += dash + dash;
    }

    for (int i = 0; i < Mood.values.length; i++) {
      final a = startAngle + (i / (Mood.values.length - 1)) * sweepAngle;
      final dot = center + Offset(outerRadius * cos(a), outerRadius * sin(a));

      final direction = (dot - center).normalize();
      final perpendicular = Offset(-direction.dy, direction.dx);
      final isSelected = i == selectedItem.index;
      if (isSelected) {
        // Draw hourglass neck for selected dot

        final base = center + direction * innerRadius;

        const gapFromDot = 28.0;
        final topCenter = dot - direction * gapFromDot;

        const topWidth = 20.0;
        const baseWidth = 20.0;
        const midWidth = 30.0;

        final topL = topCenter + perpendicular * topWidth;
        final topR = topCenter - perpendicular * topWidth;
        final baseL = base + perpendicular * baseWidth;
        final baseR = base - perpendicular * baseWidth;

        final midL = Offset.lerp(topL, baseL, 0.5)! + perpendicular * -midWidth;
        final midR = Offset.lerp(topR, baseR, 0.5)! + perpendicular * midWidth;

        final path = Path()
          ..moveTo(topL.dx, topL.dy)
          ..cubicTo(topL.dx, topL.dy, midL.dx, midL.dy, baseL.dx, baseL.dy)
          ..lineTo(baseR.dx, baseR.dy)
          ..cubicTo(midR.dx, midR.dy, topR.dx, topR.dy, topR.dx, topR.dy)
          ..close();

        canvas.drawPath(path, neckPaint);
      } else {
        // Draw simple triangle for non-selected dots

        const triangleHeight = 10.0;
        const triangleBaseHalf = 12.0;

        const tipOffset = 10.0; // distance outside inner circle edge
        final tipPoint = center + direction * (innerRadius + tipOffset);
        final basePoint1 =
            tipPoint -
            direction * triangleHeight +
            perpendicular * triangleBaseHalf;
        final basePoint2 =
            tipPoint -
            direction * triangleHeight -
            perpendicular * triangleBaseHalf;

        final path = Path()
          ..moveTo(tipPoint.dx, tipPoint.dy)
          ..lineTo(basePoint1.dx, basePoint1.dy)
          ..lineTo(basePoint2.dx, basePoint2.dy)
          ..close();

        canvas.drawPath(path, neckPaint);
      }
      final dotPaint = Paint()
        ..color = isSelected
            ? color
            : Mood.values[i].color.withValues(alpha: 0.3)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(dot, itemRadius, Paint()..color = Colors.white);
      canvas.drawCircle(dot, itemRadius, dotPaint);

      final imageOffser = Offset(
        dot.dx - (imageSize / 2),
        dot.dy - (imageSize / 2),
      );
      canvas.drawImage(image[i], imageOffser, Paint());
    }

    // Draw inner circle last
    canvas.drawCircle(center, innerRadius, innerCirclePaint);
    canvas.drawCircle(center, innerRadius - 6, innerFilledCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

extension on Offset {
  Offset normalize() => this / distance;
}

class ArcClipper extends CustomClipper<Path> {
  final double startAngle; // in degrees
  final double sweepAngle; // in degrees

  ArcClipper({required this.startAngle, required this.sweepAngle});

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path();

    final radiansStart = radians(startAngle);
    final radiansSweep = radians(sweepAngle);

    path.moveTo(size.width / 2, size.height / 2); // center
    path.arcTo(rect, radiansStart, radiansSweep, false);
    path.close();

    return path;
  }

  double radians(double degrees) => degrees * pi / 180;

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
