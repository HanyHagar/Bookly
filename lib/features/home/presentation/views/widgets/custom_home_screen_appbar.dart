import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeScreenAppbar extends StatelessWidget {
  const CustomHomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/images/bookly.svg',
            width: mediaQuery.width/10,
            height: mediaQuery.height/30,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search_outlined),
            iconSize: mediaQuery.height/30,
          )
        ],
      ),
    );
  }
}
