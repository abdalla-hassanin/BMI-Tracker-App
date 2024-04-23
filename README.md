# BMI Tracker App

A new Flutter project.

## Download

You can download the latest version of the app from the following link:

[Download APK](https://github.com/abdalla-hassanin/BMI-Tracker-App/blob/master/app-release.apk)

#User fake: 

abd@gmail.com

12345678

## Architecture
BMI Tracker follows the Clean Architecture pattern to maintain separation of concerns and facilitate scalability. The app is divided into the following components:
- **Entities**: Define core business objects like events.
- **Use Cases**: Contain application-specific business rules.
- **Repositories**: Provide an interface for accessing data.
- **Data Sources**: Implement data sources such as local database or remote server.
- **Models**: Define data models used throughout the app.
- **Repository Implementations**: Concrete implementations of repositories.
- **Controller with Provider**: Manage the application's state and business logic using the Provider.

```
└── lib/
    ├── domain/               # Domain layer
    │   ├── entities/         # Domain entities
    │   ├── repositories/     # Abstract repositories interfaces
    │   └── use_cases/        # Business logic (use cases)
    │
    ├── data/                 # Data layer
    │   ├── models/           # Data models
    │   ├── repositories_impl/# Implementations of repositories
    │   └── datasources/      # Data sources (e.g., API, Firebase)
    │
    └── presentation/         # Presentation layer
        ├── provider/         # provider
        ├── screens/          # UI screens
        └── widgets/          # UI widgets
```
  
