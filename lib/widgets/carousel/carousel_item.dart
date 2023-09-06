import 'package:flutter/material.dart';
import 'package:paywall_challenge/extensions/context_extension.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.imageUrl,
    required this.imageCaption,
  }) : super(key: key);

  final String imageUrl;
  final String imageCaption;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: context.dynamicHeight(232),
        color: const Color(0xFF383434),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Image.asset(
                imageUrl,
                height: context.dynamicHeight(203),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                imageCaption,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
