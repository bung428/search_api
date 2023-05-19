# search_api

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

----------------------------------------------------------------------------------------

### Git Url
[SearchApi App : git url](https://github.com/bung428/search_api)

### Development environment
- IDE         : Android Studio Chipmunk | 2021.2.1 Patch 1
- Android SDK : 33.0.0
- Flutter     : 3.10.0
- Dart        : 3.0.0
- DevTools    : 2.23.1

### Build & Run Environment Configuration
- clean -> Clean Architecture Structure Applied Versions
  - `flutter run`

- simple -> Versions using the simple architecture that you usually used
  - `flutter run --dart-define=DEFINE_APP_NAME=SearchApiSimple --dart-define=DEFINE_APP_SUFFIX=.simple --dart-define=DEFINE_APP_MODE=simple`

### Directory structure

```bash
├── architecture
│   ├── clean_arch
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   └── remote
│   │   │   │       └── topics_api_service.dart
│   │   │   └── repositories
│   │   │       ├── api_repository_impl.dart
│   │   │       └── base_api_repository.dart
│   │   └── domain
│   │       ├── models
│   │       │   ├── requests
│   │       │   │   ├── search_topics_request.dart
│   │       │   │   ├── search_topics_request.freezed.dart
│   │       │   │   └── search_topics_request.g.dart
│   │       │   ├── responses
│   │       │   │   ├── search_topics.dart
│   │       │   │   ├── search_topics.freezed.dart
│   │       │   │   ├── search_topics.g.dart
│   │       │   │   ├── topic_item.dart
│   │       │   │   ├── topic_item.freezed.dart
│   │       │   │   └── topic_item.g.dart
│   │       │   └── api_response.dart
│   │       └── repository
│   │           └── api_repository_dart
│   └── simple_arch
│       └── service
│           ├── api
│           │   └── search.dart
│           └── dio_service.dart
│  
├── src
│   ├── bloc
│   │   └── bloc_provider.dart
│   ├── page
│   │   ├── detail
│   │   │   ├── search_detail_bloc.dart
│   │   │   └── search_detail_page.dart
│   │   └── main
│   │       ├── search_main_bloc.dart
│   │       └── search_main_page.dart
│   ├── route
│   │   ├── app_links.dart
│   │   └── app_router.dart
│   ├── widget
│   │   ├── app_bar_stream_widget.dart
│   │   ├── box_widget.dart
│   │   ├── load_more_listview.dart
│   │   ├── search_bar_widget.dart
│   │   ├── stream_builder_widget.dart
│   │   └── topic_item_widget.dart
│   └── dependencies.dart
├── env.dart
└── main.dart 
``` 

### Dependencies
Network

`dio: ^5.1.2`


Models

`freezed_annotation: ^2.2.0`

`json_annotation: ^4.8.1`


Others

`go_router: ^7.0.1`

`get_it: ^7.2.0`

`rxdart: ^0.27.7`

`fluttertoast: ^8.2.1`


Dev Dependencies

`freezed: ^2.3.4`

`build_runner: ^2.4.4`

`json_serializable: ^6.6.2`

`flutter_lints: ^2.0.0`

