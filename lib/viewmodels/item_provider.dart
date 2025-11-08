import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/item_model.dart';
import '../services/storage.dart';


final storageServiceProvider = Provider((ref) => StorageService());


final itemProvider = NotifierProvider<ItemNotifier, List<ItemModel>>(() {
  return ItemNotifier();
});


final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});

class ItemNotifier extends Notifier<List<ItemModel>> {
  final Uuid _uuid = const Uuid();

  @override
  List<ItemModel> build() {
    
    return ref.read(storageServiceProvider).getAllItems();
  }

  StorageService get _storageService => ref.read(storageServiceProvider);

  Future<void> addItem(String title, String description) async {
    final newItem = ItemModel(
      id: _uuid.v4(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

   
    await _storageService.addItem(newItem);

   
    state = [...state, newItem];
  }

  Future<void> updateItem(ItemModel updatedItem) async {
    // Save to storage first
    await _storageService.updateItem(updatedItem);

    // Then update the state
    state = [
      for (final item in state)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
  }

  Future<void> deleteItem(String id) async {
    // Delete from storage first
    await _storageService.deleteItem(id);

    // Then update the state
    state = state.where((item) => item.id != id).toList();
  }
}

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final savedMode = ref.read(storageServiceProvider).getThemeMode();

    if (savedMode == 'light') {
      return ThemeMode.light;
    } else if (savedMode == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  StorageService get _storageService => ref.read(storageServiceProvider);

  Future<void> setThemeMode(ThemeMode mode) async {
    
    state = mode;

    // Then save to storage
    String modeString;
    if (mode == ThemeMode.light) {
      modeString = 'light';
    } else if (mode == ThemeMode.dark) {
      modeString = 'dark';
    } else {
      modeString = 'system';
    }
    await _storageService.saveThemeMode(modeString);
  }
}
