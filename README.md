# Flutter Item Manager

A simple Flutter application for managing items with full CRUD (Create, Read, Update, Delete) operations, featuring persistent storage and theme customization.

## 📋 Features

✅ **CRUD Operations**
- Add new items with title and description
- Edit existing items
- Delete items with swipe gesture
- View all items in a list

✅ **Persistent Storage**
- Data persists across app restarts using Hive
- Fast and efficient local database

✅ **Theme Support**
- Light and Dark theme toggle
- Theme preference saved locally
- Material 3 design

## 🏗️ Architecture

### MVVM (Model-View-ViewModel)

```
lib/
├── models/              # Data models
│   └── item_model.dart
├── viewmodels/          # Business logic & state management
│   └── item_provider.dart # Contains ItemNotifier and ThemeModeNotifier
├── views/               # UI screens
│   ├── home_screen.dart
│   └── add_edit_item_screen.dart
├── services/            # Data layer
│   └── storage.dart
├── theme/               # Theme definitions
│   ├── app_theme.dart
│   └── theme.dart
└── main.dart            # App entry point
```

### Why Riverpod?

1. **Clear Separation**: Business logic separated from UI
2. **Testability**: Easy to unit test ViewModels
3. **Scalability**: Easy to add new features
4. **Maintainability**: Changes in one layer don't affect others
5. **Riverpod Benefits**: Recommended by Flutter team, simple to use, less boilerplate

## 🛠️ Technologies & Libraries

### State Management
- **flutter_riverpod**: ^2.5.1

### Storage
- **hive_flutter**: ^1.1.0
- **hive**: ^2.2.3

### Utilities
- **uuid**: ^4.0.0

### Dev Dependencies
- **hive_generator**: ^2.0.1
- **build_runner**: ^2.4.7

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter plugin

### Installation

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd assesment
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate Hive adapters**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

## 📱 How to Use

### Adding an Item
1. Tap the floating action button (+) on the home screen
2. Enter a title and description
3. Tap "Add Item"

### Editing an Item
1. Tap on any item card
2. Modify the title or description
3. Tap "Update Item"

### Deleting an Item
1. Swipe left on any item card
2. Confirm deletion in the dialog

### Changing Theme
- Tap the sun/moon icon in the app bar to toggle between light and dark themes

## 🎨 Design Patterns Used

1. **MVVM Pattern**: Separates UI from business logic
2. **Repository Pattern**: StorageService abstracts data access
3. **Riverpod Pattern**: For state management
4. **Factory Pattern**: Model creation with copyWith

## 📂 Key Files Explained

### Models (`item_model.dart`)
Defines the data structure for items with Hive annotations for persistence.

### ViewModels (`item_provider.dart`)
Manages item state and CRUD operations (`ItemNotifier`) and theme state (`ThemeModeNotifier`).

### Services (`storage.dart`)
Handles all Hive database operations, abstracting storage logic.

### Views
- `home_screen.dart`: Main screen displaying item list.
- `add_edit_item_screen.dart`: Screen for adding/editing items.

## 🧪 Testing

To run tests:
```bash
flutter test
```

## 🔄 Future Enhancements

- [ ] Search and filter items
- [ ] Categories/tags for items
- [ ] Export/import data
- [ ] Cloud sync
- [ ] Item priority levels
- [ ] Rich text editor for descriptions

## 📝 Code Quality

- Follows Flutter best practices
- Proper error handling
- Form validation
- Responsive UI
- Loading states
- User feedback (SnackBars)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

Your Name - Flutter Developer Assessment

## 🙏 Acknowledgments

- Flutter team for excellent documentation
- Hive for fast local storage
- Riverpod for simple state management