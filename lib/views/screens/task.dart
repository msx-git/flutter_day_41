import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/persistent_header.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  late final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showPopular = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(popularListener);
  }

  void popularListener() {
    double popularOffset = 1452;
    if (scrollController.offset < popularOffset) {
      showPopular.value = true;
    } else {
      showPopular.value = false;
    }
  }

  @override
  void dispose() {
    showPopular.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(scrollController.offset);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          controller: scrollController,
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
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
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
            ValueListenableBuilder<bool>(
              valueListenable: showPopular,
              builder: (context, value, child) {
                return SliverVisibility(
                  visible: value,
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 40,
                      maxHeight: 60,
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              showPopular.value ? 'Popular' : "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
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
                );
              },
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
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image_3.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 130,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 14,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Men's Fashion\nCollection",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Discount up to 60%",
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
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
