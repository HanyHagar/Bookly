import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenBody extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final String name;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;

  const SplashScreenBody({
    super.key,
    required this.image,
    this.width = double.infinity,
    this.height = 150,
    required this.name,
    this.fontColor = Colors.black,
    this.fontSize = 32,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(flex: 4),
            SvgPicture.asset(
              image,
              width: width,
              height: height,
            ),
            const Spacer(flex: 3),
            Text(
              name,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: fontColor, // Use customizable fontColor
                fontSize: fontSize, // Use customizable fontSize
                fontWeight: fontWeight, // Use customizable fontWeight
                fontFamily: 'Chokokutai'
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
