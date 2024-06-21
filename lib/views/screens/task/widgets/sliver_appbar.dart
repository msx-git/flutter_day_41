import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}
