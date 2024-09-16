# Elevated Project

This Flutter project implements a product listing screen using the [Fake Store API](https://fakestoreapi.com/products). It demonstrates the use of Clean Architecture with BLoC pattern for state management.

## Screenshots

<img src="https://github.com/hussendev/Elevated_project/raw/main/assets/screenshot/1.png" width="300">

<img src="https://github.com/hussendev/Elevated_project/raw/main/assets/screenshot/2.png" width="300">

## Features

- Fetches and displays a list of products from the Fake Store API
- Implements Clean Architecture
- Uses BLoC pattern for state management
- Utilizes Dio for API calls
- Implements dependency injection using get_it
- Uses Repository pattern for data handling

## Project Structure

```
lib/
├── core/
│   ├── api/
│   │   └── dio_consumer.dart
│   ├── error/
│   │   └── exceptions.dart
│   └── usecase/
│       └── usecase.dart
├── features/
│   └── products/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── product_remote_data_source.dart
│       │   ├── models/
│       │   │   └── product_model.dart
│       │   └── repositories/
│       │       └── product_repository.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── product.dart
│       │   ├── repositories/
│       │   │   └── base_product_repository.dart
│       │   └── usecases/
│       │       └── get_all_products_use_case.dart
│       └── presentation/
│           ├── cubit/
│           │   └── products_cubit.dart
│           ├── screens/
│           │   └── products_screen.dart
│           └── widgets/
│               └── product_item.dart
├── injection_container.dart
└── main.dart
```

## Dependencies

- `flutter_bloc: ^8.1.3`
- `dio: ^5.3.1`
- `get_it: ^7.6.0`
- `dartz: ^0.10.1`
- `equatable: ^2.0.5`
- `internet_connection_checker: ^2.0.0`
- `google_fonts: ^6.2.1`

## Setup and Running

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Architecture Overview

This project follows the Clean Architecture pattern, which is divided into three main layers:

1. **Presentation Layer**: Contains the UI (Screens and Widgets) and the BLoC (Cubit in this case) for state management.
   - `products_screen.dart`
   - `product_item.dart`
   - `products_cubit.dart`

2. **Domain Layer**: Contains the business logic of the application. It's written in pure Dart without any dependencies to external data.
   - Entities: `product.dart`
   - Use Cases: `get_all_products_use_case.dart`
   - Repository Interfaces: `base_product_repository.dart`

3. **Data Layer**: Manages the application data and exposes this data to the Domain layer.
   - Models: `product_model.dart`
   - Repositories: `product_repository.dart`
   - Data Sources: `product_remote_data_source.dart`

The Dependency Rule is followed: source code dependencies only point inwards. Nothing in an inner circle can know anything at all about something in an outer circle.
