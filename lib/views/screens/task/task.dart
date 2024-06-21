import 'package:flutter/material.dart';

import 'widgets/sliver_widgets.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            /// Appbar
            const SliverAppbarWidget(),

            /// POPULAR label
            PopularHeader(showPopular: showPopular),

            /// GRID VIEW
            const SliverGridWidget(),

            /// MEN_FASHION label
            const FashionLabel(),

            /// LIST VIEW
            const SliverListWidget(),
          ],
        ),
      ),
    );
  }
}
