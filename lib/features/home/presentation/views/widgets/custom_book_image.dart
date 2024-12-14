import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final double spaceBeforeElement;
  const CustomBookImage({super.key, required this.width, required this.height, required this.image, required this.spaceBeforeElement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(
          start: spaceBeforeElement
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          // Set the desired radius here
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            placeholder: (context, url) => Container(color: Colors.grey,),
            errorWidget: (context, url, error) => Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }
}
