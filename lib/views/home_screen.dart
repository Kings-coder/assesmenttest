import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assesment/viewmodels/item_provider.dart';
import 'package:assesment/views/add_edit_item_screen.dart';
import 'package:assesment/widgets/item_list_tile.dart';
import 'package:assesment/widgets/app_theme_toggle_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Manager'),
        actions: const [AppThemeToggleButton()],
      ),
      body: items.isEmpty
          ? const Center(child: Text('No items yet. Add one!'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemListTile(item: item);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditItemScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
