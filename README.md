# ToDoMust-App

A simple Flutter Todo app using GetX for state management, routing, and bindings. Supports localization, theme switching, and API calls with GetConnect and a local JSON server. Data and settings persist with GetStorage—so no data is lost when the app closes. I’m new to Flutter & GitHub—feedback and suggestions are very welcome!

## Features

- Add, update, and delete todo tasks
- State management with GetX
- Localization & internationalization support
- Light/Dark theme switching with persistent settings
- API communication via GetConnect
- Local JSON server for offline/testing support
- Persistent data storage with GetStorage
- Upload profile and cover images using Image Picker
- Custom-built calendar widget created from scratch

### Prerequisites

- Flutter SDK installed ([flutter.dev](https://flutter.dev))
- Dart SDK installed (usually comes with Flutter)

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/jimtwenty2/ToDoMust-App.git

   cd ToDoMustApp

   flutter pub get

   flutter run
   ```

About the JSON Server ( https://github.com/typicode/json-server/tree/v0 )
The app uses a local JSON server to simulate API calls, allowing offline testing and easier backend integration without a real remote server. This helps with development and testing CRUD operations locally.
⚠️ Important:

- Be sure to set your local IP address in ApiService (e.g., http://192.168.x.x:3000) so your app can connect to the server.
- Place your db.json inside lib/services/db_api/ or another accessible directory.
- To Start the JSON Server: > json-server --watch db.json --host 0.0.0.0 --port 3000

Image Picker Integration
Users can upload profile and cover images using the device’s camera or gallery via the Flutter Image Picker package, integrated with GetX for smooth state management.

Custom Calendar
A fully custom calendar widget is built from scratch to display and select dates within the app, giving you flexibility to customize UI and interactions beyond built-in calendar widgets.
