import 'package:flutter/material.dart';

class AdaptiveTable<T> extends StatelessWidget {
  const AdaptiveTable({
    required this.items,
    required this.itemBuilder,
    required this.rowBuilder,
    required this.columns,
    this.breakpoint = 600,
  });

  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final DataRow Function(T item, int index) rowBuilder;
  final List<DataColumn> columns;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth >= breakpoint) {
          return DataTable(
            columns: columns,
            rows: [
              for (var i = 0; i < items.length; i++) rowBuilder(items[i], i),
            ],
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return itemBuilder(item, index);
          },
        );
      },
    );
  }
}
