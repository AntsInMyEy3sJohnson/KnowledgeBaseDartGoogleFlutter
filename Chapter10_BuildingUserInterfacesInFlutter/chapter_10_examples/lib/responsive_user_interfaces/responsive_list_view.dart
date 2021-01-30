import 'package:flutter/material.dart';

class ResponseListView extends StatelessWidget {
  const ResponseListView();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context)?.orientation;
    final width = MediaQuery.of(context)?.size?.width ?? -1;

    return Scaffold(
      appBar: AppBar(
        title: Text("$orientation with width of ${width.round()}"),
      ),
      // Better: Use a LayoutBuilder to use information about
      // the screen's current constraints for making decisions
      // about what widgets to use and how to display them
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints sizes) {
          if (sizes.maxWidth < 500) {
            return const _ListData();
          }
          return const _GridData();
        },
      ),
    );
  }
}

class _GridData extends StatelessWidget {
  const _GridData();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4.0,
      children: List.generate(100, (index) {
        return Center(
          child: ListTile(
            leading: const Icon(Icons.android_sharp),
            title: Text("Item No. $index"),
          ),
        );
      }),
    );
  }
}

class _ListData extends StatelessWidget {
  const _ListData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, id) {
        return ListTile(
          leading: const Icon(Icons.android),
          title: Text("Item No. $id"),
        );
      },
    );
  }
}
