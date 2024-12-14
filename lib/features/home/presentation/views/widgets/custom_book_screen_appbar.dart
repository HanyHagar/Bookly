import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookScreenAppbar extends StatelessWidget {
  const CustomBookScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon:  Icon(
              Icons.close,
              size: mediaQuery.height/30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.shopping_cart_outlined,
              size: mediaQuery.height/30,
            ),
          ),
        ],
      ),
    );
  }
}
