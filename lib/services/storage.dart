import 'package:hive/hive.dart';

import '../models/item_model.dart';

class StorageService {
  // Box names as constants
  static const String _itemsBoxName = 'items';
  static const String _settingsBoxName = 'settings';

  // Private getters for boxes
  Box<ItemModel> get _itemsBox => Hive.box<ItemModel>(_itemsBoxName);
  Box get _settingsBox => Hive.box(_settingsBoxName);

  // ==================== ITEMS CRUD ====================

  /// Get all items from storage
  List<ItemModel> getAllItems() {
    return _itemsBox.values.toList();
  }

  /// Add a new item
  Future<void> addItem(ItemModel item) async {
    await _itemsBox.put(item.id, item);
  }

  /// Update an existing item
  Future<void> updateItem(ItemModel item) async {
    await _itemsBox.put(item.id, item);
  }

  /// Delete an item by ID
  Future<void> deleteItem(String id) async {
    await _itemsBox.delete(id);
  }

  /// Get a specific item by ID
  ItemModel? getItem(String id) {
    return _itemsBox.get(id);
  }

  // ==================== SETTINGS ====================

  /// Save theme mode preference
  Future<void> saveThemeMode(String mode) async {
    await _settingsBox.put('themeMode', mode);
  }

  /// Get saved theme mode
  String? getThemeMode() {
    return _settingsBox.get('themeMode');
  }
}
