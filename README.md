# Bookly App

## Table of Contents

- [Overview](#overview)
  - [Purpose](#purpose)
  - [Key Highlights](#key-highlights)
- [Features](#features)
  - [Home Screen](#-home-screen)
  - [Book Details Screen](#-book-details-screen)
  - [Search Screen](#-search-screen)
  - [Splash Screen](#-splash-screen)
- [Architecture](#architecture)
  - [Project Structure](#-project-structure)
  - [Architecture Components](#-architecture-components)
- [Technical Implementation](#technical-implementation)
  - [State Management](#-state-management)
  - [Navigation](#-navigation)
  - [Networking](#-networking)
  - [UI Components](#-ui-components)
  - [Dependency Injection](#-dependency-injection)
- [API Integration](#api-integration)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Environment Setup](#environment-setup)
  - [Installation](#installation)
  - [Building for Production](#building-for-production)
- [Dependencies](#dependencies)
- [Future Enhancements](#future-enhancements)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Overview

Bookly is a comprehensive Flutter mobile application designed to provide users with an elegant and intuitive platform for discovering, browsing, and searching books through the Google Books API. The application implements modern mobile development practices including clean architecture, state management with BLoC pattern, and responsive UI design.

### Purpose

The primary purpose of Bookly is to offer book enthusiasts a streamlined experience for exploring literature, with a focus on computer science books. The application serves as both a practical tool for users and a demonstration of Flutter development best practices.

### Key Highlights

- **Clean Architecture**: Separation of concerns with distinct data, domain, and presentation layers
- **BLoC Pattern**: Efficient state management using the flutter_bloc package
- **Google Books API Integration**: Real-time access to a vast library of books
- **Responsive Design**: Fluid UI that adapts to different screen sizes
- **Cross-Platform**: Compatible with both iOS and Android platforms

## Features

### 🏠 Home Screen
- **Featured Books Carousel**: Horizontally scrollable list of featured computer science books
- **Newest Books List**: Vertically scrollable list of the newest free computer science books
- **Search Functionality**: Access to search feature via the magnifying glass icon

### 📖 Book Details Screen
- **Book Information**: Displays comprehensive details about a selected book
- **Similar Books**: Shows books in the same category as the selected book
- **Navigation**: Easy return to previous screens

### 🔍 Search Screen
- **Search Input**: Text field for entering search queries
- **Search Results**: Displays books matching the search query
- **Default Search**: Initially shows results for "Computer Science" if no query is entered

### 💦 Splash Screen
- Animated introduction screen with the app logo
- Automatically navigates to the home screen after a brief delay

## Architecture

The app follows a clean architecture approach with the following structure:

### 📂 Project Structure

The project follows a feature-based organization with clean architecture principles:

```
lib/
├── Features/
│   ├── home/
│   │   ├── data/
│   │   │   └── repos/                 # Repository interfaces and implementations
│   │   │       ├── home_repo.dart     # Repository interface
│   │   │       └── home_repo_impl.dart # Repository implementation
│   │   └── presentation/
│   │       ├── manager/               # State management
│   │       │   ├── featured_books_cubit/
│   │       │   ├── newest_books_cubit/
│   │       │   └── similar_books_cubit/
│   │       ├── views/                 # Screen definitions
│   │       │   ├── book_details_view.dart
│   │       │   └── home_view.dart
│   │       └── widgets/               # UI components
│   │           ├── book_details_view_body.dart
│   │           ├── custom_app_bar.dart
│   │           ├── featured_books_list_view.dart
│   │           ├── home_view_body.dart
│   │           ├── newest_books_list_view.dart
│   │           └── similar_books_list_view.dart
│   ├── search/
│   │   ├── data/
│   │   │   └── repos/
│   │   │       ├── search_repo.dart
│   │   │       └── search_repo_impl.dart
│   │   └── presentation/
│   │       ├── manager/
│   │       │   └── search_books_cubit/
│   │       ├── views/
│   │       │   └── search_view.dart
│   │       └── widgets/
│   │           ├── search_results_list_view.dart
│   │           └── search_view_body.dart
│   └── splash/
│       └── presentation/
│           ├── splash_view.dart
│           └── widgets/
│               ├── sliding_widget.dart
│               └── splash_view_body.dart
├── constants.dart                     # App-wide constants
├── core/                              # Shared functionality
│   ├── data/
│   │   └── models/
│   │       └── book_model/            # Data models
│   │           ├── book_model.dart
│   │           ├── volume_info.dart
│   │           ├── image_links.dart
│   │           └── ... (other model files)
│   ├── errors/
│   │   └── failure.dart               # Error handling
│   ├── utils/
│   │   ├── api_service.dart           # API communication
│   │   ├── app_router.dart            # Navigation
│   │   ├── assets.dart                # Asset references
│   │   ├── functions/                 # Utility functions
│   │   │   ├── custom_snack_bar.dart
│   │   │   └── launch_custom_url.dart
│   │   ├── service_locator.dart       # Dependency injection
│   │   └── styles.dart                # UI styles
│   └── widgets/                       # Shared widgets
│       ├── custom_button.dart
│       ├── custom_error_widget.dart
│       └── custom_loading_indicator.dart
└── main.dart                          # Application entry point
```

**Additional Project Files:**

```
├── assets/                            # Application assets
│   ├── fonts/
│   │   └── GT Sectra Fine Regular.ttf # Custom font
│   └── images/
│       ├── bookly_logo.png            # App logo
│       └── test_image.png             # Test image
├── pubspec.yaml                       # Project configuration
└── test/                              # Test directory
    └── widget_test.dart               # Widget tests
```

### 🏗️ Architecture Components

#### Data Layer
- **Models**: Data classes representing book information (BookModel, VolumeInfo, etc.)
- **Repositories**: Interfaces and implementations for data access
  - HomeRepo/HomeRepoImpl: Fetches featured, newest, and similar books
  - SearchRepo/SearchRepoImpl: Handles book search functionality

#### Presentation Layer
- **Views**: UI screens (HomeView, BookDetailsView, SearchView, SplashView)
- **Widgets**: Reusable UI components
- **State Management**: Uses BLoC pattern with Cubit for managing application state
  - FeaturedBooksCubit: Manages state for featured books
  - NewestBooksCubit: Manages state for newest books
  - SimilarBooksCubit: Manages state for similar books
  - SearchBooksCubit: Manages state for search results

#### Core
- **Utils**: Helper classes and functions
  - ApiService: Handles API requests to Google Books API
  - AppRouter: Manages navigation using GoRouter
  - ServiceLocator: Dependency injection using GetIt
- **Widgets**: Common widgets used across the app
- **Errors**: Error handling with Failure classes

## Technical Implementation

### 🔄 State Management
- **flutter_bloc**: Used for state management with Cubit pattern
- **equatable**: Simplifies equality comparisons for state objects

### 🧭 Navigation
- **go_router**: Handles navigation between screens

### 🌐 Networking
- **dio**: HTTP client for API requests
- **dartz**: Functional programming features (Either type for error handling)

### 🖼️ UI Components
- **cached_network_image**: Efficient loading and caching of book cover images
- **google_fonts**: Custom typography with Google Fonts
- **font_awesome_flutter**: Icon set for UI elements

### 💉 Dependency Injection
- **get_it**: Service locator for dependency injection

## API Integration

### Google Books API

The application integrates with the Google Books API to retrieve comprehensive book data. The implementation uses Dio HTTP client for efficient network requests and follows best practices for API integration.

#### Base URL
`https://www.googleapis.com/books/v1`

#### Endpoints

| Purpose | Endpoint | Parameters | Description |
|---------|----------|------------|-------------|
| Newest Books | `/volumes` | `Filtering=free-ebooks`<br>`Sorting=newest`<br>`q=computer science` | Retrieves the most recently added free ebooks related to computer science |
| Featured Books | `/volumes` | `Filtering=free-ebooks`<br>`Sorting=relevance`<br>`q=subject:computer science` | Retrieves the most relevant free ebooks in the computer science category |
| Book Search | `/volumes` | `Filtering=free-ebooks`<br>`Sorting=newest`<br>`q=intitle:{query}` | Searches for free ebooks with titles matching the user's query |
| Similar Books | `/volumes` | `Filtering=free-ebooks`<br>`Sorting=relevance`<br>`q=subject:{category}` | Finds books in the same category as a selected book |

#### Response Handling

The application implements robust error handling for API responses:

- Success responses are parsed into the appropriate data models
- Error responses are categorized and presented to the user with meaningful messages
- Network issues are gracefully handled with appropriate user feedback

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (^3.8.1)
- **Dart SDK** (compatible with Flutter SDK version)
- **IDE**: Android Studio or Visual Studio Code with Flutter extensions
- **Git**: For version control and cloning the repository

### Environment Setup

1. Make sure your Flutter environment is properly set up by running:
   ```bash
   flutter doctor
   ```
   Address any issues identified by the Flutter doctor command.

### Installation

1. Clone the repository from GitHub:
   ```bash
   git clone https://github.com/yourusername/bookly_app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd bookly_app
   ```

3. Install all required dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application on your connected device or emulator:
   ```bash
   flutter run
   ```

### Building for Production

To build a release version of the application:

- For Android:
  ```bash
  flutter build apk --release
  ```

- For iOS:
  ```bash
  flutter build ios --release
  ```

## Dependencies

### Production Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8      # iOS-style icons
  get: ^4.7.2                  # State management alternative
  go_router: ^16.0.0           # Navigation and routing
  font_awesome_flutter: ^10.8.0 # Additional icon set
  google_fonts: ^6.2.1         # Google Fonts integration
  flutter_dotenv: ^5.2.1       # Environment variable management
  equatable: ^2.0.7            # Value equality
  dartz: ^0.10.1               # Functional programming
  dio: ^5.8.0+1                # HTTP client
  flutter_bloc: ^9.1.1         # BLoC state management
  get_it: ^8.0.3               # Dependency injection
  cached_network_image: ^3.4.1  # Image caching
  url_launcher: ^6.3.2         # URL handling
```

### Development Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0        # Linting rules
```

## Future Enhancements

The following features are planned for future releases of the Bookly application:

### Planned Features

| Feature | Description | Priority |
|---------|-------------|----------|
| User Authentication | Implementation of user accounts with Firebase Authentication | High |
| Personalized Recommendations | Book recommendations based on user reading history and preferences | Medium |
| Offline Mode | Local storage of favorite books for offline access using Hive or SQLite | High |
| Advanced Filtering | Enhanced search with multiple filters (author, publisher, year, etc.) | Medium |
| Theme Customization | Toggle between light and dark themes with additional color schemes | Medium |
| Reading Functionality | Integrated e-book reader for supported formats | Low |
| Social Sharing | Share book recommendations on social media platforms | Low |
| Reading Lists | Create and manage custom reading lists and collections | Medium |

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2023 Bookly App

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Acknowledgements

- [Google Books API](https://developers.google.com/books) for providing comprehensive book data
- [Flutter](https://flutter.dev/) team for the excellent cross-platform framework
- All contributors to the open-source packages utilized in this project
- [Font Awesome](https://fontawesome.com/) for the icon set
- [Google Fonts](https://fonts.google.com/) for typography
