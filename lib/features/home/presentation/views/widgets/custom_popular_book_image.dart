
import 'package:blur/blur.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomFeatureBookImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final double spaceBeforeElement;
  final bool isPopular;

  const CustomFeatureBookImage(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      required this.spaceBeforeElement,
      this.isPopular = true,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CustomBookImage(
            width: width,
            height: height,
            image: image,
            spaceBeforeElement: spaceBeforeElement,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: width / 5,
            ).blurred(
              blurColor: Colors.white38,
              blur: 1,
              borderRadius: BorderRadius.circular(50),
            ),
          )
        ],
      ),
    );
  }
}
