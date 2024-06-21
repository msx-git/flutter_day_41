import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/persistent_header.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            /// Appbar
            SliverAppBar(
              leading: Container(
                margin: const EdgeInsets.only(left: 6),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white38),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              title: const Text(
                "Order Details",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white38),
                  child: const Icon(CupertinoIcons.ellipsis_vertical),
                ),
              ],
              pinned: true,
              centerTitle: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/image_1.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              expandedHeight: 500,
            ),

            /// POPULAR label
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 40,
                maxHeight: 60,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// GRID VIEW
            SliverGrid(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ 26.15",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      Text(
                        index.isEven
                            ? "Pull & Bear men's..."
                            : "ZARA United Arab...",
                      ),
                    ],
                  );
                },
                childCount: 6,
              ),
            ),

            /// MEN_FASHION label
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 40,
                maxHeight: 60,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Men's Fashion",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// LIST VIEW
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 100,
                    decoration: const BoxDecoration(),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [Text('data')],
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
