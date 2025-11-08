import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assesment/models/item_model.dart';
import 'package:assesment/viewmodels/item_provider.dart';
import 'package:assesment/views/add_edit_item_screen.dart';
import 'package:assesment/theme/theme.dart';

class ItemListTile extends ConsumerWidget {
  final ItemModel item;

  const ItemListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemNotifier = ref.read(itemProvider.notifier); 

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Delete"),
              content: const Text("Are you sure you want to delete this item?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Delete"),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        itemNotifier.deleteItem(item.id);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${item.title} dismissed')));
      },
      child: Card(
        margin: ThemeConstants.paddingSmall,
        child: ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddEditItemScreen(item: item),
              ),
            );
          },
        ),
      ),
    );
  }
}
