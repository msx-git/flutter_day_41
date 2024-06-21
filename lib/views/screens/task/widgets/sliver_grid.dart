import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1 / 1.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final String image = index.isEven
              ? 'assets/images/image_1.jpg'
              : 'assets/images/image_2.webp';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 192,
                  height: 250,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    index.isEven ? "\$ 26.15" : "\$ 24.34",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Icon(Icons.favorite_border)
                ],
              ),
              Text(
                index.isEven ? "Pull & Bear men's..." : "ZARA United Arab...",
              ),
            ],
          );
        },
        childCount: 6,
      ),
    );
  }
}
