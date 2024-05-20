import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

// This creates 100 scrollable items
class SomeScrollableContent extends StatelessWidget {
  const SomeScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBarScrollNotifier(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

// This creates 100 scrollable items which can be used with the floating seach bar
class FloatingSearchAppBarExample extends StatelessWidget {
  const FloatingSearchAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingSearchAppBar(
      title: const Text('Title'),
      transitionDuration: const Duration(milliseconds: 800),
      color: Colors.greenAccent.shade100,
      colorOnScroll: Colors.greenAccent.shade200,
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
