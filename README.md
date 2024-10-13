# ValueCoin

A new Flutter project focused on providing real-time cryptocurrency data and interactive features.

## Features

- 📈 **Dynamic Exchange Details**: View exchange details dynamically based on the selected coin.
- 🔄 **Interactive Dropdown**: Active dropdown list to display page icons and other details.
- 🧭 **Navigation**: Navigate between pages using `Navigator` and `MaterialPageRoute`.
- 💳 **Information Cards**: Detailed cryptocurrency coin descriptions.
- 🌐 **Network Images**: Display actual coin images using network images.
- 📊 **Percentage Change Widget**: Implement percentage change display in the home page.
- 📉 **Current Price Widget**: Fetch and display current price data from an API.
- 🚀 **API Integration**: Fetch data using `Http.get` requests with progress indicators.
- 📱 **Responsive Design**: Access device width and height for responsive UI elements.
- ⚙️ **Configuration Management**: Load configuration from JSON files before app start.
- 🛠️ **Dependency Injection**: Use `get_it` package for dependency management.
- 🔑 **API Key Management**: Configure API keys and manage dependencies in `pubspec.yaml`.

## Packages Used

- `dio`: For performing HTTP requests.
- `get_it`: For dependency injection.
- `flutter`: The core framework for building the app.
- `provider`: State management solution.
- `flutter_bloc`: Implementation of the BLoC pattern.
- `cached_network_image`: For efficient image loading and caching.
- `intl`: For internationalization and localization.

## Demo

1) Open the app ✔
2) See the dropdown list ✔
3) Select the coin and check the details ✔
4) Double tap coin image and navigate into the exchange rate page ✔
   


https://github.com/user-attachments/assets/49eea6c4-0564-407c-9755-f1e6551f85a6

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- An IDE: [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository:**
  ```sh
  git clone https://github.com/yourusername/valuecoin.git
  ```
2. **Navigate to the project directory:**
  ```sh
  cd valuecoin
  ```
3. **Install dependencies:**
  ```sh
  flutter pub get
  ```

### Running the App

1. **Connect a device or start an emulator.**
2. **Run the app:**
  ```sh
  flutter run
  ```

### Folder Structure

```plaintext
lib/
├── main.dart
├── models/
├── pages/
└── services/
```

### Additional Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
