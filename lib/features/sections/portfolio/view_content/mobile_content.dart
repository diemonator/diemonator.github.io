import '../../../../core/constants/app_assets.dart';
import '../../../../core/navigation/app_routes.dart';
import 'view_content.dart';

const MapEntry<AppRoutes, List<ViewContent>> mobileContent = MapEntry(
  AppRoutes.mobile,
  [
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.flutter,
      title: 'Imgur Flutter – Modern Flutter App Stack 🚀',
      description: '''
Imgur Flutter is a cutting-edge mobile app built with Flutter, leveraging powerful technologies for performance, scalability, and seamless user experience.

🔹 State Management: BLoC, Provider, GetIt
🔹 Networking: Dio, Smart Retry
🔹 Localization: Intl, Flutter Localizations
🔹 Storage: Shared Preferences, Secure Storage, ObjectBox
🔹 Navigation: GoRouter, Deep Linking
🔹 Media Handling: Cached Images, Video Playback
🔹 Authentication: OAuth2, URL Launcher
🔹 Testing & Code Generation: Freezed, JSON Serializable, Bloc Test

Built for speed, reliability, and a smooth user experience. 🚀''',
      gitHubLink: 'https://',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.modularplug,
      title: 'Application – Modular Flutter Project with Melos 🚀🔧',
      description: '''
Application is a modular Flutter project structured with Melos, enabling efficient package management and scalable architecture.

🔹 Modular Architecture: Divided into multiple apps (car, gas_station, airplane) and shared packages (common, auth).
🔹 State Management: BLoC pattern with flutter_bloc and dependency injection via get_it.
🔹 Navigation: go_router for flexible routing.
🔹 Networking & Storage: dio, shared_preferences, flutter_secure_storage.
🔹 Internationalization: intl support (Flutter Intl disabled for custom handling).
🔹 Code Generation: freezed, json_serializable, build_runner for efficiency.

Built for scalability, maintainability, and modular development using Melos! 🚀✨''',
      gitHubLink: 'https://',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.youtube,
      title:
          '''IPTV Streaming App – High-Performance Streaming with YouTube-Like Visuals 📺🔥''',
      description: '''
A next-gen IPTV streaming app designed for seamless live TV and on-demand content, featuring smooth animations and visual effects inspired by YouTube.

🔹 State Management: Stacked, GetIt for responsive UI & efficient data flow.
🔹 Networking: Dio with Smart Retry for fast, stable streaming.
🔹 Localization: Intl, Flutter Localizations for global support.
🔹 Storage & Persistence: Shared Preferences, Secure Storage, Hive for EPG storage.
🔹 Navigation: auto_route with deep linking for seamless browsing.
🔹 Media Handling: Cached Network Image for thumbnails, better_player for adaptive playback.
🔹 Animations & UI Effects: Smooth transitions, custom loading effects, and engaging UI like YouTube.
🔹 Testing & Code Generation: Freezed, JSON Serializable.

A feature-rich, visually immersive IPTV experience with high-quality streaming and intuitive navigation! 🚀🎬''',
      gitHubLink: 'https://',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.layers,
      title: 'Modular Flutter App – Scalable & Maintainable Architecture 🚀🔧',
      description: '''
A cutting-edge Flutter application built with a clean, modular architecture ensuring scalability and maintainability.

🔹 Vertical & Horizontal Modularity – Organized into layers (Presentation, Domain, Data) for better separation of concerns.
🔹 State Management – Powered by provider and get_it for efficient dependency injection.
🔹 Networking – dio with dio_smart_retry for robust API calls and error handling.
🔹 Storage & Persistence – hive, flutter_secure_storage for secure and efficient data storage.
🔹 Authentication – Utilizes flutter_inappwebview for seamless web-based authentication flows.
🔹 UI & Animations – flutter_svg, fl_chart, and carousel_slider for a sleek and interactive experience.
🔹 Google Maps Integration – google_maps_flutter for location-based services.
🔹 Crash Reporting & Analytics – Integrated firebase_crashlytics and firebase_core.
🔹 JSON & Code Generation – json_annotation, equatable for efficient data handling.

A robust, modular, and future-proof Flutter application designed to scale effortlessly! 🚀📱''',
      gitHubLink: '',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.flutterPackage,
      title:
          '''Jobs Flutter – Embedded Flutter Module for Native & Web with Method Channels 🏗📱🌍🔗''',
      description: '''
Jobs Flutter is a Flutter module designed to be seamlessly embedded into existing native Android & iOS apps, as well as web platforms, enabling deep integration with native components via Method Channels.

🔹 Cross-Platform Integration: Runs inside native apps (Android & iOS) and can be embedded into web apps.
🔹 Native Communication: Uses Method Channels to interact with native platform features (camera, sensors, storage, etc.).
🔹 State Management: Provider & GetIt for efficient dependency injection.
🔹 Navigation: GoRouter for structured in-app routing.
🔹 Authentication: Auth0 for secure user login across platforms.
🔹 Geolocation & Maps: Geolocator, Google Maps, Cluster Manager for location-based features.
🔹 Networking & API: Dio for handling API requests.
🔹 Web Compatibility: Google Maps Flutter Web, Responsive Builder for a seamless web experience.
🔹 UI & Animations: Carousel Slider, Toggle Switch, Flutter Animations for engaging interfaces.
🔹 Internationalization: Flutter Intl for multilingual support.
🔹 Code Generation: Freezed, JSON Serializable, Build Runner for optimized performance.

A scalable, flexible, and performance-optimized Flutter module with native and web support, plus deep Method Channel integration! 🚀🔥''',
      gitHubLink: '',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.budget,
      title:
          'Smart Budgeting App – Scalable & Localized Flutter Boilerplate 🚀📱',
      description: '''
Smart Budgeting App is a highly structured boilerplate for scalable app development with multi-flavor support and built-in localization.

🔹 State Management: BLoC, Provider, GetIt for dependency injection.
🔹 Networking & API Handling: Dio with Smart Retry for resilient requests.
🔹 Storage & Persistence: Shared Preferences, Secure Storage, Isar (NoSQL).
🔹 Navigation: GoRouter for efficient routing.
🔹 Internationalization: Flutter Intl with deferred loading.
🔹 Validation & Utilities: Regexed Validator, Result Dart, WorkManager for background tasks.
🔹 Animations & UI: Flutter Animations package, Gap for spacing.
🔹 Code Generation: Freezed, JSON Serialization, Isar Generator.

Optimized for performance, modularity, and multilingual support! 🚀''',
      gitHubLink: '',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.portfolio,
      title: 'Portfolio – Modern Flutter Web & Mobile App 🌐🚀',
      description: '''
Portfolio is a sleek and adaptive Flutter project designed for web and mobile, leveraging top-tier technologies for smooth performance and a great user experience.

🔹 UI & Layout: Adaptive Scaffold, Staggered Animations, Gap
🔹 State Management: BLoC, GetIt, Equatable
🔹 Navigation: GoRouter for declarative routing
🔹 Media & Graphics: Flutter SVG support
🔹 Networking & Storage: Shared Preferences, URL Launcher
🔹 Internationalization: Intl, Flutter Localizations
🔹 Firebase Integration: Analytics, Crashlytics, Remote Config
🔹 Code Generation & Serialization: Freezed, JSON Serializable

Optimized for adaptability, performance, and seamless user engagement. 🚀''',
      gitHubLink: 'https://github.com/diemonator/diemonator.github.io',
    ),
    ViewContent(
      svgLanguage: AppAssets.flutter,
      svgImage: AppAssets.stretching,
      title:
          '''SmartMove – Interactive Fitness App with Real-Time Engagement 🏋️‍♂️📲''',
      description: '''
An innovative fitness tracking and engagement app designed for interactive training sessions, real-time communication, and gamified experiences.

🔹 State Management: Stacked MVVM architecture with Stacked Services & Hooks for modular and scalable development.
🔹 Networking: Socket.IO for WebSocket-based real-time communication and instant updates.
🔹 Localization: Supports multiple languages for global accessibility.
🔹 Storage: Efficient data handling with JSON Serializable for structured information management.
🔹 Navigation: AutoRoute for type-safe, declarative routing ensuring seamless transitions.
🔹 Media Handling: Lottie animations for engaging visual effects in workouts.
🔹 Authentication: Secure and seamless login options for user identity management.
🔹 Testing & Code Generation: Build Runner, AutoRoute Generator, and Injectable Generator for optimized development workflows.

SmartMove delivers an immersive fitness experience with real-time engagement, intuitive navigation, and visually rich workouts! 🚀''',
    ),
    ViewContent(
      svgLanguage: AppAssets.ios,
      svgImage: AppAssets.ios,
      title: 'Printer Light Control Application for Cannon OCE-Printers',
      description: '''
Real-Time Printer Monitoring – Tracks the status of three printers and their consumable levels (paper, cyan, magenta, yellow, and black ink).

Intelligent Light Alerts – Lights indicate depletion levels:
  🔹 Paper Lamp: Fades from green to red as paper runs out.
  🔹 Cyan & Magenta Lamps: Turn on at 25%, blink at 15%, and signal critical depletion.

Other features:
🔹 Reset Functionality – Reset all printers at once or individual consumables as needed.
🔹 JSON-Controlled Lights – Uses JSON commands to turn lights on/off, change colors, fade, and blink for alerts.
🔹 Multithreaded System – Ensures smooth, independent consumable depletion for each printer.
🔹 Adaptive UI – Designed for both desktops and tablets, mimicking a real printer terminal for ease of use.''',
    ),
    ViewContent(
      svgLanguage: AppAssets.ios,
      svgImage: AppAssets.ios,
      title: 'Bulls and Cows – Multiplayer Number Guessing Game',
      description: '''
🔹 Gameplay:
Each player selects a secret 4-digit number (no repeating digits).
Players take turns guessing each other’s number.
Bulls (🐂) – Correct digit in the correct position.
Cows (🐄) – Correct digit in the wrong position.
The first player to guess the opponent’s number wins!

🔹 Features:
Real-time multiplayer using Socket.io for seamless gameplay.
Interactive iOS UI for guessing and tracking results.
Node.js server handles player connections, turn management, and result validation.

A fun and competitive way to test logic and deduction skills! 🎯''',
    ),
    ViewContent(
      svgLanguage: AppAssets.android,
      svgImage: AppAssets.android,
      title: 'Android Music Player – Multi-Threaded Audio App',
      description: '''
🔹 Overview:
A lightweight and efficient Android music player designed to play and manage audio files using multithreading for smooth performance.

🔹 Features:
Background Playback – Uses threads to play music while running other tasks.
Multi-Threaded Processing – Ensures smooth UI interactions while handling audio playback.
Media Controls – Play, pause, stop, skip, and seek functionality.
Playlist Support – Users can create, manage, and play custom playlists.
Threaded UI Updates – Keeps the interface responsive while fetching metadata or loading songs.

🔹 Technology Stack:
Java for Android development.
MediaPlayer API for audio playback.
Threads & Handlers for smooth background operations.

A fast and reliable music player that delivers a seamless listening experience! 🎵🎶''',
    ),
    ViewContent(
      svgLanguage: AppAssets.android,
      svgImage: AppAssets.android,
      title: 'Sligro News App – Hacker News Attack Updates',
      description: '''
Overview:
An Android news application built with Java and Fragments, providing real-time updates on the latest hacking attacks from Hacker News.

🔹 Features:
Live Cybersecurity News – Fetches the latest hacking-related news from Hacker News API.
Fragment-Based UI – Ensures smooth navigation between different news sections.
Article Details View – Click on a news item to see full details.
Refresh & Auto-Update – Keeps news feeds updated dynamically.
Lightweight & Fast – Optimized for smooth performance and low resource usage.

🔹 Technology Stack:
Java for Android development.
Fragments for modular UI design.
Retrofit for fetching news from Hacker News API.

Stay informed about the latest cybersecurity threats with Sligro News App! 🔐📲''',
    ),
    ViewContent(
      svgLanguage: AppAssets.android,
      svgImage: AppAssets.android,
      title: 'Meet App – Location Sharing & Chatting',
      description: '''
A real-time location-sharing and chat application built with Kotlin & XML for Android and a Node.js server for backend communication.

🔹 Features:
Live Location Sharing – Users can share their real-time location with friends.
Instant Messaging – Chat with contacts in private or group conversations.
Map Integration – View friends’ locations on an interactive map.
Secure Backend – Node.js server with Socket.io ensures fast and reliable communication.
User Authentication – Secure login and profile management.

🔹 Technology Stack:
Kotlin & XML for Android UI and logic.
Google Maps API for location tracking.
Socket.io & Node.js for real-time chat and location updates.

Connect, chat, and share locations effortlessly with Meet App! 📍💬''',
    ),
  ],
);
