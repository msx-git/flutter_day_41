import 'package:flutter/material.dart';

import '../widgets/persistent_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            //title: Text('Sliver App Bar'),
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar of CustomScroll'),
            ),
            expandedHeight: 200,
          ),
          const SliverToBoxAdapter(child: Text("Sliver List")),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('List Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 200,
              child: Container(
                color: Colors.green,
                child: const Center(child: Text("SliverPersistentHeader 3")),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Text("Sliver Grid")),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemExtent: 160,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.teal[100 * (index % 9)],
                      margin: const EdgeInsets.only(right: 10),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
